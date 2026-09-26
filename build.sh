#!/data/data/com.termux/files/usr/bin/bash

pkg update
apt install perl -y
cd latexindent.pl || exit
echo 'yes' | cpan
cpan -i App::cpanminus
cpanm -f PAR::Packer
cpanm YAML::Tiny
cpanm File::HomeDir
cpanm Unicode::GCString
# shellcheck disable=2016
sed -i -r 's,eval\s\"use\sUnicode::GCString\"\sif\s\$switches\{GCString\},use Unicode::GCString,' latexindent.pl
export PAR_VERBATIM=1
pp --addfile="defaultSettings.yaml;lib/LatexIndent/defaultSettings.yaml" --cachedeps=scancache --output latexindent latexindent.pl
