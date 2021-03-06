#!/usr/bin/perl

use strict;
use warnings;
use inc::Module::Install 0.65;
use File::Copy;

copy ('ledgersmb.conf.default', 'ledgersmb.conf') unless -f 'ledgersmb.conf';

name 'LedgerSMB';
version_from 'LedgerSMB.pm';
license 'GPL';

perl_version '5.8.1';

requires 'Data::Dumper';
requires 'Carp::Always';
requires 'Log::Log4perl';
requires 'Locale::Maketext';
requires 'DateTime';
requires 'Locale::Maketext::Lexicon' => '0.62';
requires 'DBI' => '1.00';
requires 'MIME::Base64';
requires 'Digest::MD5';
requires 'HTML::Entities';
requires 'DBD::Pg';
requires 'Math::BigFloat';
requires 'IO::File';
requires 'IO::Scalar';
requires 'Encode';
requires 'Time::Local';
requires 'Cwd';
requires 'Config::IniFiles';
requires 'MIME::Lite';
requires 'Template' => '2.14';
requires 'CGI::Simple';
requires 'File::MimeInfo';
requires 'Number::Format';
requires 'DateTime::Format::Strptime';
requires 'Moose';
requires 'namespace::autoclean';
requires 'PGObject';
requires 'PGObject::Simple';
requires 'PGObject::Simple::Role';
requires 'PGObject::Type::BigFloat';
requires 'PGObject::Type::DateTime';
requires 'PGObject::Util::DBMethod';
requires 'PGObject::Util::DBAdmin' => '0.05';

recommends 'Math::BigInt::GMP';

test_requires 'Test::More';
test_requires 'Test::Trap';
test_requires 'Test::Exception';

feature 'RESTful Web Services XML support',
    -default => 0,
    'XML::Simple' => 0;

feature 'Size detection for images for embedding in LaTeX templates',
    -default => 0,
    'Image::Size' => 0;

feature 'POS module credit card processing support',
    -default => 0,
    'Net::TCLink' => 0;

feature 'Experimental scripting engine',
    -default => 0,
    'Parse::RecDescent' => 0;

feature 'Developer tool dependencies',
    -default => 0,
    'Getopt::Long' => 0,
    'FileHandle' => 0,
    'Locale::Country' => 0,
    'Locale::Language' => 0;

feature 'X12 EDI support',
    -default => 0,
    'X12::Parser' => 0;

# Rendering options
feature 'PDF and Postscript output',
    -default => 0,
    'Template::Plugin::Latex' => 0,
    'TeX::Encode' => 0;

feature 'OpenOffice.org output',
    -default => 0,
    'XML::Twig' => 0,
    'OpenOffice::OODoc' => 0;

Makefile->postamble(
     qq{installdb :: \n\tLSMB_INSTALL_DB=1 LSMB_TEST_DB=1 make test\n}
);

Makefile->postamble(
     qq{installdb_interactive :: \n\tperl install_interactive.pl\n}
);


auto_install; # remove this line for 2.0
WriteAll;
