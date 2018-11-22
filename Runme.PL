#!/usr/bin/env perl

use strict;
use warnings;
use File::Copy;
use Getopt::Long;

my $make = 'make';
my $dry_run;
my $verbose;

GetOptions (
    "m|make=s"     => \$make,
    "dry-run!"     => \$dry_run,
    "v|verbose!"   => \$verbose,
    "help"         => \&usage,
) or die "Bad options, see `perl $0 help`";

sub usage {
    print <<"EOF";
Build modules, recursively.
Usage:
    perl $0 [options] <target> ...
This will run `perl Makefile.PL` in all subdirectories and then
run `make <target>` for all targets specified.

Options may include:
    -m,--make - specify make command (default make)
    -v,--verbose - print extensive messages
    --dry-run - don't do anything, just print (implies -v)
    --help - this message

Special targets:
    dist - requires test, manifest; copies files to root directory
    clean - removes files in root directory
EOF
    exit 0;
};

my @todo = @ARGV;

usage() if !@todo or $todo[0] eq "help";
$verbose++ if $dry_run;

my @modules = sort grep { -f "$_/Makefile.PL" } mask( '.', '^[A-Z]' );

my %dep = (
    dist => [qw[manifest test]],
);
my %post = (
    dist => sub {
        move ($_, '..')
            for mask( '.', '\.tar\.gz$' );
    },
    clean => sub {
        unlink "../$_" for mask ( '..', '\.tar\.gz$' );
    },
);

my %uniq;
@todo =
    grep { !$uniq{$_}++ } 
    map  { resolve_deps( \%dep, $_ ) } @todo;

foreach my $dir (@modules) {
    message( "Entering directory $dir" );
    chdir $dir or die "Failed to chdir $dir: $!";

    command( 'perl', 'Makefile.PL' ); 
    foreach my $action (@todo) {
        command( $make, $action );
        if (my $extra = $post{$action}) {
            message( "Execution post-action for $action" );
            $extra->($dir, $action)
                unless $dry_run;
        };
    };
    message( "Leaving directory $dir" );
    chdir "..";
};

sub command {
    message( "Running @_" );
    return if $dry_run;
    system @_;
    if ($?) {
        die "Command `@_` returned ".($?>>8);
    };
};

sub resolve_deps {
    my ($hash, $name, $seen) = @_;

    $seen ||={};
    die "Circular dependency $name"
        if $seen->{$name}++;

    my $list = $hash->{$name} || [];
    
    my @all = ( (map { resolve_deps($hash, $_, $seen) } @$list), $name );
    return @all;
};

sub mask {
    my ($where, $regex) = @_;

    opendir (my $dir, $where)
        or die "Failed to open dir $where: $!";
    return grep { $_ =~ /$regex/ } readdir $dir;
};

sub message {
    print " --- $0: @_\n"
        if $verbose;
};
