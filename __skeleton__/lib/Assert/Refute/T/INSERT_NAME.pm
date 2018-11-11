package Assert::Refute::T::INSERT_NAME;

use 5.006;
use strict;
use warnings;
our $VERSION = '0.01';

=head1 NAME

Assert::Refute::T::INSERT_NAME - Test::Deep plugin for Assert::Refute

=head1 SYNOPSIS

See L<Assert::Refute> for what a C<try_refute> block is for.
In a nutshell, it's a set of L<Test::More>-like assertions
that appends its results to a "report" object
rather than standard output.

    use Assert::Refute;
    use Assert::Refute::T::INSERT_NAME;

    my $report = try_refute {
        ...
    };

It may also be used with L<Test::More>:

    use Test::More;
    use Assert::Refute::T::INSERT_NAME;

    ...

=head1 EXPORT

=cut

use parent qw(Exporter);
use Assert::Refute::Build;

=head2 my_check

    ...

=cut

build_refute my_check => sub {
    return 1; # autofail
}, args => 0, export => 1;

=head1 AUTHOR

Konstantin S. Uvarin, C<< <khedin at gmail.com> >>

=head1 BUGS

Please report bugs via github or RT:

=over

=item * L<https://github.com/dallaylaen/assert-refute-t-extra/issues>

=item * C<bug-assert-refute-t-deep at rt.cpan.org>

=item * L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Assert-Refute-T-INSERT_NAME>

=back

=head1 SUPPORT

You can find documentation for this module with the C<perldoc> command.

    perldoc Assert::Refute::T::INSERT_NAME

You can also look for information at:

=over 4

=item * github: L<https://github.com/dallaylaen/assert-refute-t-extra> 

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Assert-Refute-T-INSERT_NAME>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Assert-Refute-T-INSERT_NAME>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Assert-Refute-T-INSERT_NAME>

=item * Search CPAN

L<http://search.cpan.org/dist/Assert-Refute-T-INSERT_NAME/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2018 Konstantin S. Uvarin.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of Assert::Refute::T::INSERT_NAME
