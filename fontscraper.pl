#!/usr/bin/perl

use strict;
use warnings; 

use Web::Scraper;
use URI;
use Encode;

my $text = $ARGV[0];
my $font = "Doh";
my $resp = "";

my $url = "http://patorjk.com/software/taag/#p=display" . "&f=" . $font . "&t=" . $text;


#print $url;

my $fontsL = scraper {
	process 'option', 'fontsL[]' => scraper {
		process "option", uri => 'TEXT';
	};
};

my $res = $fontsL->scrape ( URI->new($url) );

print "\@fonts = ( ";

for my $fontL (@{$res->{fontsL}}) {
	print Encode::encode("utf8", "\'$fontL->{uri}\', ");
}

print ");";