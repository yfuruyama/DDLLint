#!/usr/bin/env perl

use strict;
use warnings;

use SQL::Translator;

sub read_ddl_from_stdin {
    local $/;
    return <STDIN>;
};

my $ddl = read_ddl_from_stdin;
my $tr = SQL::Translator->new;
close STDERR;
$tr->parser('MySQL')->($tr, $ddl);

if ($tr->schema->is_valid) {
    print "valid\n";
} else {
    print "invalid\n";
}
