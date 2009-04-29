#!/usr/bin/perl -w
use strict;

my $topic = shift || die "Provide a topic\n";
my $section = shift || '';

my $where = `man -w $section $topic`;
die "Can't find man page for $topic\n" unless length($where) && !$?;
chomp($where);
system("man -l -Tps $where > /tmp/$topic.ps");
if (-s "/tmp/$topic.ps") { 
	warn "ps file left at /tmp/$topic.ps\n"
}
else {
	warn "postscript generation failed!\n"
}
