use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME		=> 'Net::Starnet::DataAccounting',
    VERSION_FROM	=> 'lib/Net/Starnet/DataAccounting.pm',
    PREREQ_PM => {
	'Getopt::Std'	=> 1.02,
	'Test::More'	=> 0.33,
	'Pod::Man'	=> 1.3,
	'Pod::Coverage'	=> 0.08,
        'Module::Info'  => 0.10,
	'Sys::Hostname'	=> 1.1,
	'Socket'	=> 1.72,
	'IO::Socket'	=> 1.26,
	'Carp'		=> 0,
    },
    EXE_FILES => [
        'bin/str',
    ],
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'lib/Net/Starnet/DataAccounting.pm', # retrieve abstract from module
      AUTHOR     => 'Iain Truskett <spoon@cpan.org>') : ()),
);
