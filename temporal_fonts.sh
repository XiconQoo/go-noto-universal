#!/usr/bin/env bash
set -e

[[ -z "$VIRTUAL_ENV" ]] && echo "Refusing to run outside of venv. See README.md." && exit 100

python3 -m pip install 'fonttools >= 4.28.5'

# import functions and globals
source url.sh
source helper.sh
source categories.sh

# --- execution starts here ---
mkdir -p cache/

# GoNotoCurrent.ttf
create_cjk_subset
create_japanese_kana_subset
create_korean_hangul_subset
create_tibetan_subset
drop_vertical_tables NotoSansMongolian-Bold.ttf
drop_vertical_tables NotoSansNushu-Bold.ttf
echo "Generating GoNotoCurrent.ttf. Current time: $(date)."
go_build GoNotoCurrent.ttf "${GoNotoCurrent[@]}"

# GoNotoAncient.ttf
drop_vertical_tables NotoSerifDogra-Bold.ttf
drop_vertical_tables NotoSansNandinagari-Bold.ttf
drop_vertical_tables NotoSerifTangut-Bold.ttf
echo "Generating GoNotoAncient.ttf. Current time: $(date)."
go_build GoNotoAncient.ttf "${GoNotoAncient[@]}"

# GoNotoCurrentSerif.ttf
echo "Generating GoNotoCurrentSerif.ttf. Current time: $(date)."
go_build GoNotoCurrentSerif.ttf "${GoNotoCurrentSerif[@]}"

# GoNotoAncientSerif.ttf
echo "Generating GoNotoAncientSerif.ttf. Current time: $(date)."
go_build GoNotoAncientSerif.ttf "${GoNotoAncientSerif[@]}"
