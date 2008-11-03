use warnings;
use strict;

use ExtUtils::MakeMaker;

my $PUBLIC_PLACE = $ENV{PUBLIC_PLACE} || "/home/$ENV{USER}/public_html/perlexamples/";
my $MACHINES     = $ENV{REMOTEMACHINES} || 'orion beowulf';

WriteMakefile(
    NAME              => 'Math::Calc',
    VERSION_FROM      => 'lib/Math/Calc.eyp',
    PREREQ_PM         => { 'Parse::Eyapp' => '1.124', 'Devel::Cover' => '0.64', 'GRID::Machine' => '0.101', }, # e.g., Module::Name => 1.1
    EXE_FILES         => [ 'scripts/calc.pl' ],
    ABSTRACT_FROM     => 'lib/Math/Calc.pod', # retrieve abstract from pod
    AUTHOR            => 'Procesadores de Lenguaje <casiano@ull.es>',
);

sub MY::postamble {

  $_ = targets();
  s/<<PUBLIC_PLACE>>/$PUBLIC_PLACE/ge;
  s/<<MACHINES>>/$MACHINES/ge;
  return $_;
}

sub targets {

  return <<'EOM';
EYAPP=eyapp
# Set EYAPPENV environment variable to '-s' if you want a standalone
# parser
EYAPPFLAGS=-m Math::Calc ${EYAPPENV}

%.pm:%.eyp 
	${EYAPP}  ${EYAPPFLAGS} -o $@ $*
	perl -Ilib -c $@

calc: lib/Math/Calc.pm 

lib/Math/Calc.pm: lib/Math/Calc.eyp lib/Math/Tail.pm
#	${EYAPP}  ${EYAPPFLAGS} -o $@ lib/Math/Calc.eyp
#	perl -Ilib -c $@

myclean: veryclean
	rm -f Math-Calc-*.tar.gz
	cover -delete

rmcalc: 
	rm -f lib/Math/Calc.pm 

mytest: calc test
	
remotetest: calc dist
	remotetest.pl ${DISTVNAME}.tar.gz <<MACHINES>>

coverage: calc
	cover -delete
	make HARNESS_PERL_SWITCHES=-MDevel::Cover test
	cover

public: calc dist
	cp ${DISTVNAME}.tar.gz <<PUBLIC_PLACE>>
EOM
}

