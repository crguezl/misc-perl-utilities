#!/usr/bin/perl -I../lib -I../../../lib -w
use strict;
use Math::Calc;
use Getopt::Long;
use Parse::Eyapp::Base qw{slurp_file};

my $debug = 0;
my $file = '';
my $result = GetOptions ("debug!" => \$debug,  
                         "file=s" => \$file
);

$debug = 0x1F if $debug;
$file = shift if !$file && @ARGV; 

my $input;
eval {
  $input = slurp_file($file) 
};
if ($@) {
  print "Expressions. Press CTRL-D (Unix) or CTRL-Z (Windows) to finish:\n";
  local $/ = undef;
  $input = <STDIN>;
}

my $parser = Math::Calc->new();
$parser->Run( \$input, $debug );
