use Module::Info;
use Test::More tests => 6;
use strict;
use warnings;

my $pkg = 'Net::Starnet::DataAccounting';

my $mod = Module::Info->new_from_module($pkg);

my $name    = $mod->name;
my $version = $mod->version;
my $dir     = $mod->inc_dir;
my $file    = $mod->file;
my $is_core = $mod->is_core;

# Only available in perl 5.6.1 and up.
# These do compile the module.
my @packages = $mod->packages_inside;
my @used     = $mod->modules_used;
my %subs     = $mod->subroutines;

# Check details:
is $name => $pkg;
like $version => qr/^(\d\.)\d/;
is $is_core => 0;

# Check package usage:
ok eq_set(\@packages => [ $pkg ]);
ok eq_set(\@used => [
          'constant',
          'IO::Socket',
          'Socket',
          'warnings',
          'Carp',
          'strict'
        ]);

# See that the methods we have exist:
my @methods = qw/_decode _encode login logout new update verbose/;
my @exists = grep { exists $subs{"${pkg}::$_"} } @methods;
ok eq_array(\@exists => \@methods);
