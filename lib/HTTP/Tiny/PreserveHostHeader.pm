package HTTP::Tiny::PreserveHostHeader;

=head1 NAME

HTTP::Tiny::PreserveHostHeader - preserve Host header on requests

=head1 SYNOPSIS

    use HTTP::Tiny::PreserveHostHeader;

    my $response = HTTP::Tiny::PreserveHostHeader->new->get(
        'http://example.com', { headers => {
            Host => 'example.net',
        } }
    );

=head1 DESCRIPTION

This module extends L<HTTP::Tiny> and allows to preserve original C<Host>
header from HTTP request.

The L<HTTP::Tiny> is strictly compatible with HTTP 1.1 spec, section 14.23:

  The Host field value MUST represent the naming authority of the origin
  server or gateway given by the original URL.

It means that L<HTTP::Tiny> always rewrite C<Host> header to the value
taken from URL.

Some non-standard HTTP clients, such as reverse HTTP proxy, need to override
C<Host> header to other value.

=for readme stop

=cut


use 5.006;

use strict;
use warnings;

our $VERSION = '0.0100';


use parent qw(HTTP::Tiny);


# Preserve Host header
sub _prepare_headers_and_cb {
    my ($self, $request, $args, $url, $auth) = @_;

    my $host;

    while (my ($k, $v) = each %{$args->{headers}}) {
        $host = $v if lc $k eq 'host';
    }

    $self->SUPER::_prepare_headers_and_cb($request, $args, $url, $auth);

    $request->{headers}{'host'} = $host if $host;

    return;
}


sub _agent {
    my ($self) = @_;
    my $class = ref $self ? ref $self : $self;
    (my $default_agent = $class) =~ s{::}{-}g;
    return $default_agent . "/" . ($class->VERSION || 0) . " " . HTTP::Tiny->_agent;
}


1;


=for readme continue

=head1 SEE ALSO

L<HTTP::Tiny>.

=head1 BUGS

If you find the bug or want to implement new features, please report it at
L<https://github.com/dex4er/perl-HTTP-Tiny-PreserveHostHeader/issues>

The code repository is available at
L<http://github.com/dex4er/perl-HTTP-Tiny-PreserveHostHeader>

=head1 AUTHOR

Piotr Roszatycki <dexter@cpan.org>

=head1 LICENSE

Copyright (c) 2014 Piotr Roszatycki <dexter@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

See L<http://dev.perl.org/licenses/artistic.html>
