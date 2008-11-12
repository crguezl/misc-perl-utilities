use warnings;
use strict;
use ExtUtils::MakeMaker;
my @scripts = qw(latex2htmllabels pmrm splicepath svntkdiff atopdf);
WriteMakefile(
    NAME              => 'Misc::Utilities',
    VERSION           => '1.0', 
    EXE_FILES         => [ map { "scripts/$_" } @scripts ],
    PREREQ_PM         => { 'ExtUtils::Installed' => '1.00', }, # e.g., Module::Name => 1.1
    ABSTRACT          => 'a set of scripts',
    AUTHOR            => 'Casiano Rodriguez Leon <casiano@ull.es>',
);
