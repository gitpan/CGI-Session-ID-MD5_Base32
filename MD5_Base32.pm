package CGI::Session::ID::MD5_Base32;

# $Id: MD5_Base32.pm_rev 1.1 2003/05/12 02:29:34 root Exp root $

use strict;
use MIME::Base32;
use Digest::MD5;

	our $VERSION = 0.01;

sub generate_id {
    my $self = shift;
    my $md5 = new Digest::MD5();
    $md5->add( $$ , time() , rand(9999) );
    return MIME::Base32::encode($md5->digest());
}


1;

=pod

=head1 NAME

CGI::Session::ID::MD5_Base32 - CGI::Session ID driver based on Base32 encoding

=head1 SYNOPSIS

    use CGI::Session;

    $session = new CGI::Session("id:MD5_Base32", undef, { Directory => '/tmp' };

=head1 DESCRIPTION

CGI::Session::ID::MD5_Base32 is to generate MD5 digest Base32 encoded random ids.
The library does not require any arguments. 

 There are two reasons why to use it
  - shorter string result
  - case insensibility

( both very usefull for user login and other similar purposes, keyboard inputs, email contained codes, etc... )

=head1 COPYRIGHT

Copyright (C) 2003 Daniel Peder. All rights reserved.

This library is free software. You can modify and distribute it under the same terms as Perl itself.

Partialy based on CGI::Session::ID::MD5 and the whole excelent CGI::Session work by

Sherzod Ruzmetov <sherzodr@cpan.org>

=head1 AUTHOR

Daniel Peder <danpeder@cpan.org>

Feedbacks, suggestions and patches are welcome.

=head1 SEE ALSO

=over 4

=item *

L<MIME::Base32|MIME::Base32> - Base32 encoding method ( insensitive to character cases thus most usefull for user keyboard inputs )

=item *

L<MIME::Base64|MIME::Base64> - Base64 encoding method

=item *

L<Incr|CGI::Session::ID::Incr> - Auto Incremental ID generator

=item *

L<CGI::Session|CGI::Session> - CGI::Session manual

=item *

L<CGI::Session::Tutorial|CGI::Session::Tutorial> - extended CGI::Session manual

=item *

L<CGI::Session::CookBook|CGI::Session::CookBook> - practical solutions for real life problems

=item *

B<RFC 2965> - "HTTP State Management Mechanism" found at ftp://ftp.isi.edu/in-notes/rfc2965.txt

=item *

L<CGI|CGI> - standard CGI library

=item *

L<Apache::Session|Apache::Session> - another fine alternative to CGI::Session

=back

=cut
