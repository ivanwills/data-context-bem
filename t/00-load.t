#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 4 + 1;
use Test::NoWarnings;

BEGIN {
    use_ok( 'Data::Context::BEM' );
    use_ok( 'Data::Context::BEM::Instance' );
    use_ok( 'Data::Context::BEM::Block' );
    use_ok( 'Data::Context::BEM::Block::Page' );
}

diag( "Testing Data::Context::BEM $Data::Context::BEM::VERSION, Perl $], $^X" );
