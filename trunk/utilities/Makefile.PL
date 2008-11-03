use warnings;
use strict;
use ExtUtils::MakeMaker;
my @scripts = qw(latex2htmllabels pmrm splicepath svntkdiff);
WriteMakefile(
    NAME              => 'Misc::Utilities',
    VERSION           => '1.0', 
    EXE_FILES         => [ map { "scripts/$_" } @scripts ],
    PREREQ_PM         => { 'ExtUtils::Installed' => '1.00', }, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Misc/Utilities.pm', # retrieve abstract from module
       AUTHOR         => 'Casiano Rodriguez Leon <casiano@ull.es>') : ()),
);
