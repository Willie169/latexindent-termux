#!/data/data/com.termux/files/usr/bin/bash

pkg update
apt install git perl -y
git clone https://github.com/cmhughes/latexindent.pl.git
cd latexindent.pl || exit
echo 'yes' | cpan
cpanm -f PAR::Packer
cpanm YAML::Tiny
cpanm File::HomeDir
cpanm Unicode::GCString
# shellcheck disable=2016
sed -i'.bak' -r 's,eval\s\"use\sUnicode::GCString\"\sif\s\$switches\{GCString\},use Unicode::GCString,' latexindent.pl
export PAR_VERBATIM=1
pp --addfile="defaultSettings.yaml;lib/LatexIndent/defaultSettings.yaml" --cachedeps=scancache --output latexindent latexindent.pl
