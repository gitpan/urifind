#!/usr/bin/perl

# ----------------------------------------------------------------------
# $Id: Makefile.PL,v 1.1.1.1 2003/07/10 20:49:53 dlc Exp $
# ----------------------------------------------------------------------
# Makefile.PL for urifind.
# Originally created on Monday, July  7, 2003.
# ----------------------------------------------------------------------

use strict;

use ExtUtils::MakeMaker;
my (%PREREQ_PM, @EXE_FILES, %clean, %macro, %dist, @AUTHOR, @ABSTRACT);

%PREREQ_PM = (
    'URI::Find' => 0,
);

@EXE_FILES = (
    'urifind'
);

%clean = (
    FILES => '$(DISTVNAME).tar$(SUFFIX)',
);

%macro = (

);

%dist = (
    PREOP => 'perldoc -t urifind > README; cpansign -s',
);

if ($] >= 5.00503) {
    @AUTHOR = (AUTHOR => 'darren chamberlain <darren@cpan.org>');
    @ABSTRACT = (ABSTRACT => '');
}
else {
    @AUTHOR = ();
    @ABSTRACT = ();
}

WriteMakefile(
    NAME        => "urifind",
    VERSION     => "1.00",  
    PREREQ_PM   => \%PREREQ_PM,
    EXE_FILES   => \@EXE_FILES,
    clean       => \%clean,
    macro       => \%macro,
    dist        => \%dist,
    @AUTHOR,
    @ABSTRACT,
);

package MY;
use File::Basename qw(basename);

sub libscan {
    my $self = shift;
    my $file = shift;
    my $bfile = basename $file;

    return if $bfile =~ m#^(TAGS|tags)$#;
    return if $bfile =~ m#^\.#;
    return if $bfile =~ m#~$#;
    return $file;
}
