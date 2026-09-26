#!/data/data/com.termux/files/usr/bin/bash

/entrypoint.sh cd latexindent.pl
/entrypoint.sh pkg update
/entrypoint.sh apt upgrade -y
/entrypoint.sh apt install clang curl git libngtcp2 make perl -y
/entrypoint.sh echo 'yes' | cpan
/entrypoint.sh cpan -i App::cpanminus
/entrypoint.sh cpanm --force PAR::Packer
/entrypoint.sh cpanm --force YAML::Tiny
/entrypoint.sh cpanm --force File::HomeDir
/entrypoint.sh cpanm --force Unicode::GCString
export PAR_VERBATIM=1
/entrypoint.sh pp --addfile="defaultSettings.yaml;lib/LatexIndent/defaultSettings.yaml" --cachedeps="$PWD/scancache" --output latexindent latexindent.pl
