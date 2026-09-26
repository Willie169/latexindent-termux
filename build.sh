#!/data/data/com.termux/files/usr/bin/bash

/entrypoint.sh pkg update
/entrypoint.sh apt upgrade -y
/entrypoint.sh apt install clang curl git libngtcp2 make perl -y
/entrypoint.sh git clone https://github.com/cmhughes/latexindent.pl.git
/entrypoint.sh cd latexindent.pl
/entrypoint.sh sed -i -r 's,eval\s\"use\sUnicode::GCString\"\sif\s\$switches\{GCString\},use Unicode::GCString,' latexindent.pl
/entrypoint.sh echo 'yes' | cpan
/entrypoint.sh cpan -i App::cpanminus
/entrypoint.sh cpanm --force PAR::Packer
/entrypoint.sh cpanm --force YAML::Tiny
/entrypoint.sh cpanm --force File::HomeDir
/entrypoint.sh cpanm --force Unicode::GCString
export PAR_VERBATIM=1
/entrypoint.sh pp --addfile="defaultSettings.yaml;lib/LatexIndent/defaultSettings.yaml" --cachedeps=scancache --output latexindent latexindent.pl
