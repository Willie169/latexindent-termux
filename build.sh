#!/data/data/com.termux/files/usr/bin/bash

pkg update
apt upgrade -y
apt install clang curl libngtcp2 make perl -y
cd latexindent.pl || exit
echo 'yes' | cpan
cpan -i App::cpanminus
cpanm --force PAR::Packer
cpanm --force YAML::Tiny
cpanm --force File::HomeDir
cpanm --force Unicode::GCString
# shellcheck disable=2016
sed -i -r 's,eval\s\"use\sUnicode::GCString\"\sif\s\$switches\{GCString\},use Unicode::GCString,' latexindent.pl
export PAR_VERBATIM=1
pp --addfile="defaultSettings.yaml;lib/LatexIndent/defaultSettings.yaml" --cachedeps=scancache --output latexindent latexindent.pl
