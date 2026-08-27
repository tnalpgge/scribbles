#!/usr/bin/env perl

use strict;
use warnings;

use Cwd qw(abs_path);
use File::Basename qw(dirname);
use Getopt::Long;
use Pod::Usage;

use lib dirname($0);

use Cud;

my $help = undef;
my $verbose = undef;
my %opts = (
    'help|h|?' => \$help,
    'verbose|v' => \$verbose,
    );
GetOptions(%opts) or pod2usage(2);
pod2usage(-exitval => 2) unless @ARGV;
pod2usage(-exitval => 0, -verbose => 1) if $help;

exit(!Cud::analyze($ARGV[0], $verbose))

__END__
=pod

=head1 NAME

B<digest.pl>

=head1 SYNOPSIS

B<digest.pl>
[B<-?>]
[B<-h>]
[B<-v>]
[B<--verbose>]
I<input-png>

=head1 DESCRIPTION

Compute SHA-256 checksum of header, palette, image data, and texts with key different from C<digest> within I<input-png>.  Compare against asserted values already present in texts with C<digest> key.  Exit non-zero on mismatch.

=cut
