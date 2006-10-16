#
# Catlyst::Action::Deserialize::YAML.pm
# Created by: Adam Jacob, Marchex, <adam@marchex.com>
# Created on: 10/12/2006 03:00:32 PM PDT
#
# $Id$

package Catalyst::Action::Deserialize::YAML;

use strict;
use warnings;

use base 'Catalyst::Action';
use YAML::Syck;

sub execute {
    my $self = shift;
    my ( $controller, $c, $test ) = @_;
 
    my $body = $c->request->body;
    if ($body) {
        my $rdata = LoadFile($c->request->body);
        $c->request->data($rdata);
    } else {
        $c->log->debug('I would have deserialized, but there was nothing in the body!');
    }
};

1;
