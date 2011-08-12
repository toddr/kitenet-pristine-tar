#!perl -T

# Trap for these modules being avail or we can't do our tests...

use Test::More tests => 4 + 1;
use Test::NoWarnings;

BEGIN {
    use_ok( 'Pristine::Tar' );
    use_ok( 'Pristine::Tar::Formats' );
    use_ok( 'Pristine::Tar::Delta' );
    use_ok( 'Pristine::Tar::Delta::Tarball' );
}

eval { require Pristine::Tar };
BAIL_OUT("Pristine::Tar not installed", 2) if $@;

diag( "Testing Pristine::Tar Perl $], $^X" );
