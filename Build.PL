use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name       => 'Data::Context::BEM',
    license           => 'perl',
    dist_author       => 'Ivan Wills <ivan.wills@gmail.com>',
    dist_version_from => 'lib/Data/Context/BEM.pm',
    requires          => {
        'perl'             => 5.008,
    },
    build_requires => {
        'Test::More'       => 0,
        'Test::NoWarnings' => 0,
    },
    share_dir => {
        dist   => 'root',
    },
    add_to_cleanup     => [ 'Data-Context-BEM-*' ],
    create_makefile_pl => 'traditional',
    create_license     => 1,
    meta_merge => {
        resources => {
            repository => 'git://github.com/ivanwills/Data-Context-BEM.git',
            bugtracker => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Data::Context::BEM',
        },
    },
);

$builder->create_build_script();
