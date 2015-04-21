#!/usr/bin/env perl
use strict;
use warnings;
use autodie qw( open );
use YAML::XS qw( LoadFile );

# Generate syntax-highlighted example code from test cases
#
# Each language implementation must pass a test suite.  Those
# tests provide ideal examples for helping users understand
# how Hookscript works.

# which languages are available?
my @langs = map { s'lang/''; $_ } glob("lang/*");
my $lang_count = scalar @langs;

# collect metadata for each language
my %about;
open my $fh, '>', '_includes/language-name.html';
for my $lang (@langs) {
    $about{$lang} = LoadFile("lang/$lang/about.yaml");

    my $pygments_name = $about{$lang}{pygments_name};
    print $fh "<span class='language-specific language-$pygments_name'>";
    print $fh $about{$lang}{english_name};
    print $fh "</span>\n";
}
close $fh;

# which examples are available?
chdir "lang/perl/t";
my @examples = map { s'[.]pl$''; $_ } glob "*";
chdir "../../..";

# generate markdown for each example
for my $example (@examples) {
    open my $fh, '>', "_includes/examples/$example.md";

    for my $lang (@langs) {
        my $name = $about{$lang}{pygments_name};
        open my $source, '<', glob("lang/$lang/t/$example.*");
        print $fh "```$name\n";
        print $fh do { local $/; <$source> };
        print $fh "```\n";
        print $fh "\n\n";
    }

    close $fh;
}
