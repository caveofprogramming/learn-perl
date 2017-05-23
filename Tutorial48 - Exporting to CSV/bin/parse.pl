use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;
use XML::Simple;

use DBI;

$| = 1;

=pod

	This is ACME XML parser version 1.0
	Use with care.
	
=cut

sub main {
	my %opts;

	# Get command line options
	getopts( 'i:e', \%opts );

	if ( !checkusage( \%opts ) ) {
		usage();
		exit();
	}

	my $dbh = DBI->connect( "dbi:mysql:bands", "john", "letmein" );

	unless ( defined($dbh) ) {
		die "Cannot connect to database.\n";
	}

	print "Connected to database.\n";

	if ( $opts{"i"} ) {
		my $input_dir = $opts{"i"};

		my @files = get_files($input_dir);
		my @data = process_files( \@files, $input_dir );
		
		print "Found " . scalar(@files) . " files\n";

		add_to_database( $dbh, \@data );
	}

	if ( $opts{"e"} ) {
		export_from_database($dbh);
	}

	# print Dumper(@data);

	$dbh->disconnect();

	print "Completed.\n";
}

sub export_from_database {
	my $dbh = shift;

	print "Exporting ...\n";
	
	my $output_file = "output.txt";
	
	open OUTPUT, '>'.$output_file or die "Cannot create output file $output_file.\n";
	
	my $sql = 'select b.id as band_id, b.name as band_name, a.id as album_id, ' .
		'a.name as album_name, a.position as position  ' .
		'from bands b join albums a on a.band_id=b.id';
	
	my $sth = $dbh->prepare($sql);
	
	unless(defined($sth)) {
		die "Unable to prepare export query.\n";
	}
	
	unless($sth->execute()) {
		die "Unable to execute export query.\n";
	}
	
	while(my $row = $sth->fetchrow_hashref()) {
		my $band_id = $row->{"band_id"};
		my $band_name = $row->{"band_name"};
		my $album_id = $row->{"album_id"};
		my $album_name = $row->{"album_name"};
		my $position = $row->{"position"};
		
		print OUTPUT "$band_id, $band_name, $album_id, $album_name, $position\n";
	}
	
	$sth->finish();
	
	print "Export completed to $output_file\n";
	
	close OUTPUT;
}

sub add_to_database {
	my ( $dbh, $data ) = @_;

	my $sth_bands  = $dbh->prepare('insert into bands (name) values (?)');
	my $sth_albums = $dbh->prepare(
		'insert into albums (name, position, band_id) values (?, ?, ?)');

	unless ($sth_bands) {
		die "Error preparing band insert SQL\n";
	}

	unless ($sth_albums) {
		die "Error preparing album insert SQL\n";
	}

	$dbh->do('delete from albums') or die "Can't clean bands table.\n";
	$dbh->do('delete from bands')  or die "Can't clean bands table.\n";

	foreach my $data (@$data) {
		my $band_name = $data->{"name"};
		my $albums    = $data->{"albums"};

		print "Inserting $band_name into database ...\n";

		unless ( $sth_bands->execute($band_name) ) {
			die "Error executing SQL\n";
		}

		my $band_id = $sth_bands->{'mysql_insertid'};

		foreach my $album (@$albums) {
			my $album_name     = $album->{"name"};
			my $album_position = $album->{"position"};

			# print "$album_name, $album_position\n";

			unless (
				$sth_albums->execute( $album_name, $album_position, $band_id ) )
			{
				die "Unlable to execute albums insert.\n";
			}
		}
	}

	$sth_bands->finish();
	$sth_albums->finish();
}

sub process_files {
	my ( $files, $input_dir ) = @_;

	my @data;

	foreach my $file (@$files) {
		push @data, process_file( $file, $input_dir );
	}

	return @data;
}

sub process_file {
	my ( $file, $input_dir ) = @_;

	print "Processing $file in $input_dir ... \n";

	my $filepath = "$input_dir/$file";

	open( INPUTFILE, $filepath ) or die "Unable to open $filepath\n";

	undef $/;

	my $content = <INPUTFILE>;

	close(INPUTFILE);

	my $parser = new XML::Simple;

	my $dom = $parser->XMLin( $content, ForceArray => 1 );

	my @output;

	foreach my $band ( @{ $dom->{"entry"} } ) {
		my $band_name = $band->{"band"}->[0];

		my $albums = $band->{"album"};

		my @albums;

		foreach my $album (@$albums) {
			my $album_name    = $album->{"name"}->[0];
			my $chartposition = $album->{"chartposition"}->[0];

			push @albums,
			  {
				"name"     => $album_name,
				"position" => $chartposition,
			  };
		}

		push @output,
		  {
			"name"   => $band_name,
			"albums" => \@albums,
		  };

	}    # foreach band

	return @output;
}

sub get_files {
	my $input_dir = shift;

	unless ( opendir( INPUTDIR, $input_dir ) ) {
		die "\nUnable to open directory '$input_dir'\n";
	}

	my @files = readdir(INPUTDIR);

	closedir(INPUTDIR);

	@files = grep( /\.xml$/i, @files );

	return @files;
}

sub checkusage {
	my $opts = shift;

	my $i = $opts->{"i"};
	my $e = $opts->{"e"};

	unless ( defined($i) or defined($e) ) {
		return 0;
	}

	return 1;
}

sub usage {
	print <<USAGE;
	
usage: perl main.pl <options>
	-i <directory>	import data; specify directory in which to find XML files.
	-e export data from database

example usage:
	# Process files in currect directory.
	perl main.pl -i . 
	perl main.pl -e
	
USAGE
}

main();
