#!/usr/bin/env perl

use strict;
use warnings;

use Cwd qw(abs_path);
use File::Basename qw(dirname);
use Getopt::Long;
use Pod::Usage;

use lib dirname($0);

use Cud;

my $dry_run = undef;
my $output = undef;
my $help = undef;
my $verbose = undef;
my %opts = (
    'help|h|?' => \$help,
    'dry-run|n' => \$dry_run,    
    'output|o=s' => \$output,
    'verbose|v' => \$verbose,
    );
GetOptions(%opts) or pod2usage(2);
pod2usage(-exitval => 0, -verbose => 1) if $help;
$output ||= $ARGV[0];

my ($b64pd, $hxd) = Cud::tag($ARGV[0], $output, $dry_run);
printf("%s: %s %s\n", $ARGV[0], $hxd, $b64pd) if $verbose;

__END__
=pod

=head1 NAME

B<digest.pl>

=head1 SYNOPSIS

B<digest.pl>
[B<-?>]
[B<-h>]
[B<-n>]
[B<-v>]
[B<-o> I<output-png>]
[B<--help>]
[B<--dry-run>]
[B<--verbose>]
[B<--output> I<output-png>]
I<input-png>

=head1 DESCRIPTION

Compute SHA-256 checksum of header, palette, image data, and texts with key different from C<digest> within I<input-png>.  Embed as new texts with key C<digest> in I<output-png>, when B<--dry-run> is not in effect.  Displays computed digests with B<--verbose>.

I<output-png> defaults to same file name as I<input-png>.

=cut
