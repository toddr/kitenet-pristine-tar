#!/usr/bin/perl
use warnings;
use strict;
use ExtUtils::MakeMaker;

# Add a few more targets.
sub MY::postamble {
q{
all:: zgz/zgz

ZGZ_SOURCES = zgz/zgz.c zgz/gzip/*.c zgz/old-bzip2/*.c
zgz/zgz: $(ZGZ_SOURCES)
	gcc -Wall -O2 -o $@ $(ZGZ_SOURCES) -lz
}
}

WriteMakefile(
	NAME		 => 'Pristine::Tar',
    AUTHOR       => 'Joey Hess <joey@kitenet.net>',
    VERSION_FROM => 'pristine-tar',
    ABSTRACT     => 'regenerate a pristine upstream tarball using only a small binary delta file and a copy of the source which can be a revision control checkout',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002 ? ('LICENSE'        => 'GPLv2', ) : ()),
    EXE_FILES    => [ 'pristine-tar', 'pristine-bz2', 'pristine-gz', 'zgz/zgz' ],
    dist         => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean        => { FILES => 'zgz/zgz Pristine-Tar-*' },
    META_MERGE  => {
        recommends => {
            'Test::Pod' => 1.14,
        },
        build_requires => {
            'Test::More' => 0,  # For testing
            'Test::NoWarnings' => 0,  # For testing
        },
        resources => {
            license => 'GPLv2',
            homepage => 'http://kitenet.net/~joey/code/pristine-tar/',
#            bugtracker => '',
            repository => 'http://git.kitenet.net/?p=pristine-tar.git',
#            MailingList => '',
        },
    },
);
