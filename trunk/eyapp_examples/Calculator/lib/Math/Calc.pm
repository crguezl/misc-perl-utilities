########################################################################################
#
#    This file was generated using Parse::Eyapp version 1.124.
#
# (c) Parse::Yapp Copyright 1998-2001 Francois Desarmenien.
# (c) Parse::Eyapp Copyright 2006-2008 Casiano Rodriguez-Leon. Universidad de La Laguna.
#        Don't edit this file, use source file "lib/Math/Calc.eyp" instead.
#
#             ANY CHANGE MADE HERE WILL BE LOST !
#
########################################################################################
package Math::Calc;
use strict;

push @Math::Calc::ISA, 'Parse::Eyapp::Driver';


BEGIN {
  # This strange way to load the modules is to guarantee compatibility when
  # using several standalone and non-standalone Eyapp parsers

  require Parse::Eyapp::Driver unless Parse::Eyapp::Driver->can('YYParse');
  require Parse::Eyapp::Node unless Parse::Eyapp::Node->can('hnew'); 
}
  

#line 7 "lib/Math/Calc.eyp"

use Math::Tail;
my %s; # symbol table

#line 32 lib/Math/Calc.pm

my $warnmessage =<< "EOFWARN";
Warning!: Did you changed the \@Math::Calc::ISA variable inside the header section of the eyapp program?
EOFWARN

sub new {
  my($class)=shift;
  ref($class) and $class=ref($class);

  warn $warnmessage unless __PACKAGE__->isa('Parse::Eyapp::Driver'); 
  my($self)=$class->SUPER::new( 
    yyversion => '1.124',
    yyGRAMMAR  =>
[
  [ _SUPERSTART => '$start', [ 'start', '$end' ], 0 ],
  [ start_1 => 'start', [ 'input' ], 0 ],
  [ _STAR_LIST => 'STAR-1', [ 'STAR-1', 'line' ], 0 ],
  [ _STAR_LIST => 'STAR-1', [  ], 0 ],
  [ input_4 => 'input', [ 'STAR-1' ], 0 ],
  [ line_5 => 'line', [ '\n' ], 0 ],
  [ line_6 => 'line', [ 'exp', '\n' ], 0 ],
  [ line_7 => 'line', [ 'error', '\n' ], 0 ],
  [ exp_8 => 'exp', [ 'NUM' ], 0 ],
  [ exp_9 => 'exp', [ 'VAR' ], 0 ],
  [ exp_10 => 'exp', [ 'VAR', '=', 'exp' ], 0 ],
  [ exp_11 => 'exp', [ 'exp', '+', 'exp' ], 0 ],
  [ exp_12 => 'exp', [ 'exp', '-', 'exp' ], 0 ],
  [ exp_13 => 'exp', [ 'exp', '*', 'exp' ], 0 ],
  [ exp_14 => 'exp', [ 'exp', '/', 'exp' ], 0 ],
  [ exp_15 => 'exp', [ '-', 'exp' ], 0 ],
  [ exp_16 => 'exp', [ 'exp', '^', 'exp' ], 0 ],
  [ exp_17 => 'exp', [ '(', 'exp', ')' ], 0 ],
],
    yyTERMS  =>
{ '$end' => 0, '(' => 0, ')' => 0, '*' => 0, '+' => 0, '-' => 0, '/' => 0, '=' => 0, '\n' => 0, '^' => 0, NEG => 1, NUM => 1, VAR => 1, error => 1 },
    yyFILENAME  => "lib/Math/Calc.eyp",
    yystates =>
[
	{#State 0
		DEFAULT => -3,
		GOTOS => {
			'input' => 2,
			'STAR-1' => 1,
			'start' => 3
		}
	},
	{#State 1
		ACTIONS => {
			'' => -4,
			"-" => 4,
			"\n" => 9,
			'NUM' => 5,
			"(" => 7,
			'VAR' => 8,
			'error' => 10
		},
		GOTOS => {
			'exp' => 6,
			'line' => 11
		}
	},
	{#State 2
		DEFAULT => -1
	},
	{#State 3
		ACTIONS => {
			'' => 12
		}
	},
	{#State 4
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 13
		}
	},
	{#State 5
		DEFAULT => -8
	},
	{#State 6
		ACTIONS => {
			"-" => 14,
			"^" => 15,
			"*" => 16,
			"\n" => 18,
			"+" => 17,
			"/" => 19
		}
	},
	{#State 7
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 20
		}
	},
	{#State 8
		ACTIONS => {
			"=" => 21
		},
		DEFAULT => -9
	},
	{#State 9
		DEFAULT => -5
	},
	{#State 10
		ACTIONS => {
			"\n" => 22
		}
	},
	{#State 11
		DEFAULT => -2
	},
	{#State 12
		DEFAULT => 0
	},
	{#State 13
		ACTIONS => {
			"^" => 15
		},
		DEFAULT => -15
	},
	{#State 14
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 23
		}
	},
	{#State 15
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 24
		}
	},
	{#State 16
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 25
		}
	},
	{#State 17
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 26
		}
	},
	{#State 18
		DEFAULT => -6
	},
	{#State 19
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 27
		}
	},
	{#State 20
		ACTIONS => {
			"-" => 14,
			"^" => 15,
			"*" => 16,
			"+" => 17,
			"/" => 19,
			")" => 28
		}
	},
	{#State 21
		ACTIONS => {
			'NUM' => 5,
			"-" => 4,
			"(" => 7,
			'VAR' => 8
		},
		GOTOS => {
			'exp' => 29
		}
	},
	{#State 22
		DEFAULT => -7
	},
	{#State 23
		ACTIONS => {
			"^" => 15,
			"*" => 16,
			"/" => 19
		},
		DEFAULT => -12
	},
	{#State 24
		ACTIONS => {
			"^" => 15
		},
		DEFAULT => -16
	},
	{#State 25
		ACTIONS => {
			"^" => 15
		},
		DEFAULT => -13
	},
	{#State 26
		ACTIONS => {
			"^" => 15,
			"*" => 16,
			"/" => 19
		},
		DEFAULT => -11
	},
	{#State 27
		ACTIONS => {
			"^" => 15
		},
		DEFAULT => -14
	},
	{#State 28
		DEFAULT => -17
	},
	{#State 29
		ACTIONS => {
			"-" => 14,
			"^" => 15,
			"*" => 16,
			"+" => 17,
			"/" => 19
		},
		DEFAULT => -10
	}
],
    yyrules  =>
[
	[#Rule _SUPERSTART
		 '$start', 2, undef
#line 297 lib/Math/Calc.pm
	],
	[#Rule start_1
		 'start', 1,
sub {
#line 14 "lib/Math/Calc.eyp"
 \%s }
#line 304 lib/Math/Calc.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 2,
sub {
#line 17 "lib/Math/Calc.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_TX1X2 }
#line 311 lib/Math/Calc.pm
	],
	[#Rule _STAR_LIST
		 'STAR-1', 0,
sub {
#line 17 "lib/Math/Calc.eyp"
 goto &Parse::Eyapp::Driver::YYActionforT_empty }
#line 318 lib/Math/Calc.pm
	],
	[#Rule input_4
		 'input', 1, undef
#line 322 lib/Math/Calc.pm
	],
	[#Rule line_5
		 'line', 1,
sub {
#line 21 "lib/Math/Calc.eyp"
 undef }
#line 329 lib/Math/Calc.pm
	],
	[#Rule line_6
		 'line', 2,
sub {
#line 22 "lib/Math/Calc.eyp"
 print "$_[1]\n" if defined($_[1]); $_[1] }
#line 336 lib/Math/Calc.pm
	],
	[#Rule line_7
		 'line', 2,
sub {
#line 24 "lib/Math/Calc.eyp"

      $_[0]->YYErrok; # error recovery
      undef
    }
#line 346 lib/Math/Calc.pm
	],
	[#Rule exp_8
		 'exp', 1,
sub {
#line 32 "lib/Math/Calc.eyp"
my $NUM = $_[1];  $NUM->[0] }
#line 353 lib/Math/Calc.pm
	],
	[#Rule exp_9
		 'exp', 1,
sub {
#line 34 "lib/Math/Calc.eyp"
my $VAR = $_[1];  
       my $id = $VAR->[0];
       my $val = $s{$id};
	 $_[0]->semantic_error("Accesing undefined variable $id at line $VAR->[1].\n") 
       unless defined($val);
       return $val;
     }
#line 366 lib/Math/Calc.pm
	],
	[#Rule exp_10
		 'exp', 3,
sub {
#line 41 "lib/Math/Calc.eyp"
my $exp = $_[3]; my $VAR = $_[1];  $s{$VAR->[0]} = $exp }
#line 373 lib/Math/Calc.pm
	],
	[#Rule exp_11
		 'exp', 3,
sub {
#line 42 "lib/Math/Calc.eyp"
my $y = $_[3]; my $x = $_[1];  $x + $y }
#line 380 lib/Math/Calc.pm
	],
	[#Rule exp_12
		 'exp', 3,
sub {
#line 43 "lib/Math/Calc.eyp"
my $y = $_[3]; my $x = $_[1];  $x - $y }
#line 387 lib/Math/Calc.pm
	],
	[#Rule exp_13
		 'exp', 3,
sub {
#line 44 "lib/Math/Calc.eyp"
my $y = $_[3]; my $x = $_[1];  $x * $y }
#line 394 lib/Math/Calc.pm
	],
	[#Rule exp_14
		 'exp', 3,
sub {
#line 46 "lib/Math/Calc.eyp"
my $y = $_[3]; my $barr = $_[2]; my $x = $_[1]; 
       return($x/$y) if $y;
       $_[0]->semantic_error("Illegal division by zero at line $barr->[1].\n");
       undef
    }
#line 405 lib/Math/Calc.pm
	],
	[#Rule exp_15
		 'exp', 2,
sub {
#line 51 "lib/Math/Calc.eyp"
my $exp = $_[2];  -$exp }
#line 412 lib/Math/Calc.pm
	],
	[#Rule exp_16
		 'exp', 3,
sub {
#line 52 "lib/Math/Calc.eyp"
my $y = $_[3]; my $x = $_[1];  $x ** $y }
#line 419 lib/Math/Calc.pm
	],
	[#Rule exp_17
		 'exp', 3,
sub {
#line 53 "lib/Math/Calc.eyp"
my $exp = $_[2];  $exp }
#line 426 lib/Math/Calc.pm
	]
],
#line 429 lib/Math/Calc.pm
    yybypass       => 0,
    yybuildingtree => 0,
    yyprefix       => '',
    yyaccessors    => {
   },
    @_,
  );
  bless($self,$class);

  $self->make_node_classes( qw{TERMINAL _OPTIONAL _STAR_LIST _PLUS_LIST 
         _SUPERSTART
         start_1
         input_4
         line_5
         line_6
         line_7
         exp_8
         exp_9
         exp_10
         exp_11
         exp_12
         exp_13
         exp_14
         exp_15
         exp_16
         exp_17} );
  $self;
}

#line 56 "lib/Math/Calc.eyp"


sub semantic_error {
  my ($parser, $msg) = @_;

  $parser->YYData->{ERRMSG} = $msg;
  $parser->YYError; 
}


=for None

=cut



#line 476 lib/Math/Calc.pm

1;
