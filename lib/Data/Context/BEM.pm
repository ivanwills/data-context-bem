package Data::Context::BEM;

# Created on: 2013-11-02 20:51:18
# Create by:  Ivan Wills
# $Id$
# $Revision$, $HeadURL$, $Date$
# $Revision$, $Source$, $Date$

use Moose;
use namespace::autoclean;
use version;
use Carp;
use Scalar::Util;
use List::Util;
use Data::Dumper qw/Dumper/;
use English qw/ -no_match_vars /;

our $VERSION = version->new('0.0.1');

extends 'Data::Context';

has '+instance_class' => (
    default => 'Data::Context::BEM::Instance',
);

has template => (
    is       => 'rw',
    isa      => 'Template',
    required => 1,
    lazy     => 1,
    builder  => '_template',
);

around BUILDARGS => sub {
    my ($orig, $class, @args) = @_;
    my $args
        = !@args     ? {}
        : @args == 1 ? $args[0]
        :              {@args};

    if ( $args->{Template} && !$args->{template} ) {
        $args->{template} = Template->new(
            $args->{Template},
        );
    }

    return $class->$orig($args);
};

around get => sub {
    my ($orig, $slef, @args) = @_;
    return $slef->$orig($args);
};

sub get_html {
    my ($self, $path, $args, $params) = @_;

    # get processed data
    my $data = $self->get($path, $params);

    # get base template
    my $base_block = $data->{block};

    # set template path per config
    $self->set_template_path();

    # call template with data
    $self->template->process(
        "block/$base_block.tt",
        {
            %$data,
            bem => $self,
        }
    );

    # if debug mode do nothing
    # if prod mode generate js & css files (concat & compress)

    return $html;
}

sub get_styles {
    my ($self, $path, $args, $params) = @_;
}

sub get_scripts {
    my ($self, $path, $args, $params) = @_;
}

sub _template {
    my ($self) = @_;

    my $template = Template->new(
    );

    return $template;
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 NAME

Data::Context::BEM - A Perl implementation of BEM

=head1 VERSION

This documentation refers to Data::Context::BEM version 0.0.1

=head1 SYNOPSIS

   use Data::Context::BEM;

   # Brief but working code example(s) here showing the most common usage(s)
   # This section will be as far as many users bother reading, so make it as
   # educational and exemplary as possible.


=head1 DESCRIPTION

BEM is a framework/protocol for how to build HTML or XML pages. The specification
suggests how to assemble a page using Blocks, Elements and Modifiers.

The essence of this module is to provide a perl implementation that particularly
allows the easy packaging of Blocks so they can be distributed alone and used
by any site using this library. The aim is also that any site using this module
can overrite any part of an external block.

=head2 Deployed Blocks

Here is what an example block (Example) might look like:

 lib/MyApp/BEM/Block/Example.pm
 root/block/example/block.js
 root/block/example/block.css

=head1 SUBROUTINES/METHODS

=head1 DIAGNOSTICS

=head1 CONFIGURATION AND ENVIRONMENT

=head1 DEPENDENCIES

=head1 INCOMPATIBILITIES

=head1 HISTORY

While this is an attempt at implementing Yandex's BEM protocol it is also
influenced by work of one of the people who originally started the work at
Yandex but left before it had evolved into BEM.

=head1 BUGS AND LIMITATIONS

There are no known bugs in this module.

Please report problems to Ivan Wills (ivan.wills@gmail.com).

Patches are welcome.

=head1 AUTHOR

Ivan Wills - (ivan.wills@gmail.com)

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2013 Ivan Wills (14 Mullion Close, Hornsby Heights, NSW Australia 2077).
All rights reserved.

This module is free software; you can redistribute it and/or modify it under
the same terms as Perl itself. See L<perlartistic>.  This program is
distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

=cut
