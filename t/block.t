use strict;
use warnings;
use Test::More;
use Data::Dumper qw/Dumper/;
use lib 't/lib';

use Data::Context::BEM;

my $path = 't/dc';

actions();

done_testing;

sub actions {
    my $bem = Data::Context::BEM->new(
        path     => $path,
        Template => {
            INCLUDE_PATH => 'root/:t/bem/',
        },
        debug => 1,
    );

    ok $bem, 'Build BEM object orrrectly';
    my $index_data = $bem->get( 'index', { some => 'data' } );
    ok $index_data->{content}[1]{set}, 'Module called and set'
        or diag explain $index_data;
}
