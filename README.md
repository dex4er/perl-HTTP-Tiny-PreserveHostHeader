[![Build Status](https://travis-ci.org/dex4er/perl-HTTP-Tiny-PreserveHostHeader.png?branch=master)](https://travis-ci.org/dex4er/perl-HTTP-Tiny-PreserveHostHeader)n
# NAME

HTTP::Tiny::PreserveHostHeader - preserve Host header on requests

# SYNOPSIS

    use HTTP::Tiny::PreserveHostHeader;

    my $response = HTTP::Tiny::PreserveHostHeader->new->get(
        'http://example.com', { headers => {
            Host => 'example.net',
        } }
    );

# DESCRIPTION

This module extends [HTTP::Tiny](https://metacpan.org/pod/HTTP::Tiny) and allows to preserve original `Host`
header from HTTP request.

The [HTTP::Tiny](https://metacpan.org/pod/HTTP::Tiny) is strictly compatible with HTTP 1.1 spec, section 14.23:

    The Host field value MUST represent the naming authority of the origin
    server or gateway given by the original URL.

It means that [HTTP::Tiny](https://metacpan.org/pod/HTTP::Tiny) always rewrite `Host` header to the value
taken from URL.

Some non-standard HTTP clients, such as reverse HTTP proxy, need to override
`Host` header to other value.

# SEE ALSO

[HTTP::Tiny](https://metacpan.org/pod/HTTP::Tiny).

# BUGS

If you find the bug or want to implement new features, please report it at
[https://github.com/dex4er/perl-HTTP-Tiny-PreserveHostHeader/issues](https://github.com/dex4er/perl-HTTP-Tiny-PreserveHostHeader/issues)

The code repository is available at
[http://github.com/dex4er/perl-HTTP-Tiny-PreserveHostHeader](http://github.com/dex4er/perl-HTTP-Tiny-PreserveHostHeader)

# AUTHOR

Piotr Roszatycki <dexter@cpan.org>

# LICENSE

Copyright (c) 2014-2016 Piotr Roszatycki <dexter@cpan.org>.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

See [http://dev.perl.org/licenses/artistic.html](http://dev.perl.org/licenses/artistic.html)
