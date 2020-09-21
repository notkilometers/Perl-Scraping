#!/usr/bin/perl

use strict;
use warnings; 
use utf8;

use WWW::Mechanize;
use HTML::TreeBuilder::XPath;
use warnings;

my $text = $ARGV[0];
my $font = "Doh";
if ( defined $ARGV[1] ) { $font = $ARGV[1]; }
my $resp = "";

my $url = "http://patorjk.com/software/taag/#p=display" . "&f=" . $font . "&t=" . $text;

print $url;

my $mech=WWW::Mechanize->new();
$mech->get($url);

my $tree=HTML::TreeBuilder::XPath->new();

$tree->parse($mech->content);

my @nodes = $tree->findnodes(q{//pre/text()});

foreach my $node(@nodes)
{
    print $node->string_value . "\n";
}
