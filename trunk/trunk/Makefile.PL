use 5.008008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Misc::Utilities',
    VERSION_FROM      => 'lib/Misc/Utilities.pm', # finds $VERSION
    EXE_FILES         => [ qw(latex2htmllabels pmrm splicepath svntkdiff) ],
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Misc/Utilities.pm', # retrieve abstract from module
       AUTHOR         => 'lusasoft <lusasoft@>') : ()),
);
