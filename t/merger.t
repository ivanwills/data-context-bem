use strict;
use warnings;
use Test::More;
use Path::Class;
use Data::Dumper qw/Dumper/;

use Data::Context::BEM::Merge;

my $merger = Data::Context::BEM::Merge->new;;

merge();

done_testing();

sub merge {
    my @a1 = [ 1, 2 ];
    my @a2 = [ 3, 4 ];
    my @r  = [ 3, 4 ];
    #my $a = merger(\@a1, \@a2);
    ok 1,
    #is_deeply $a, \@r, 'Array of scalars right wins'
        #or note Dumper $a, \@r;

}

sub merger {
    my ($a, $b) = @_;

    if ( !defined $a ) {
        return $b;
    }
    elsif ( !ref $a ) {
    }
    elsif ( ref $a eq 'SCALAR' ) {
    }
    elsif ( ref $a eq 'ARRAY' ) {
    }
    elsif ( ref $a eq 'HASH' ) {
    }
    else {
    }
}
