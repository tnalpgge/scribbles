# -*- perl -*-

package Cud;

use strict;
use warnings;

use Digest;

use Image::PNG::Const qw(PNG_TEXT_COMPRESSION_NONE);
use Image::PNG::Libpng qw(read_png_file);

sub chew {
    my $href;
    return join '', map { $_ . $href->{$_} } sort keys %$href;
}

sub texts {
    my $pngin = shift;
    return $pngin->get_text();
}

sub nondigests {
    my $pngin = shift;
    my $texts = texts($pngin);
    return [ grep { $_->{key} ne 'digest' } @$texts ];
}

sub digests {
    my $pngin = shift;
    my $texts = texts($pngin);
    return [ grep { $_->{key} eq 'digest' } @$texts ];
}

sub swallow {
    my $pngin = shift;
    my $digest = Digest->new("SHA-256");
    my $valid = $pngin->get_valid();
    my @valid_chunks = sort grep { $valid->{$_} } keys %$valid;
    my $fake_ihdr = chew($pngin->get_IHDR());
    $digest->add($fake_ihdr);
    my $fake_plte = chew($pngin->get_PLTE());
    $digest->add($fake_plte);
    my $rows = $pngin->get_rows();
    $digest->add($_) for @$rows;
    my $texts = nondigests($pngin);
    $digest->add(chew($_)) for @$texts;
    return $digest;
}

sub analyze {
    my $infile = shift;
    my $verbose = shift;
    my $pngin = read_png_file($infile);
    my $digest = swallow($pngin);
    my $b64pd = $digest->clone()->base64_padded_digest();
    my $hxd = $digest->hexdigest();
    if ($verbose) {
	printf("computed: %s\n", $_) for ($b64pd, $hxd);
    }
    my $digests = digests($pngin);
    my @matches = grep {
	printf("asserted: %s\n", $_->{text}) if $verbose;
	($_->{text} eq $b64pd) || ($_->{text} eq $hxd)
    } @$digests;
    if (scalar @$digests < 1) {
	warn "no asserted digests\n";
    }
    return (scalar @matches == scalar @$digests);
}

sub tag {
    my $infile = shift;
    my $outfile = shift;
    my $dry_run = shift;    
    my $pngin = read_png_file($infile);
    my $pngout = $pngin->copy_png();
    my $digest = swallow($pngout);
    my $b64pd = $digest->clone()->base64_padded_digest();
    my $hxd = $digest->hexdigest();
    $pngout->set_text([
	{
	    compression => PNG_TEXT_COMPRESSION_NONE,
	    key => 'digest',
	    text => $b64pd,
	},
	{
	    compression => PNG_TEXT_COMPRESSION_NONE,
	    key => 'digest',
	    text => $hxd,
	}
		      ]);
    $pngout->write_png_file($outfile) unless $dry_run;
    return ($b64pd, $hxd);
}

1;
__END__
