#!/bin/bash
set -e -f -o pipefail
source "/usr/local/etc/babun.instance"
source "$babun_tools/script.sh"

for root_dir in /*
do
	link_target=$(readlink $root_dir)

	if [[ "$link_target" =~ ^\/cygdrive\/.$ ]]; then
		rm "$root_dir"
	fi
done

for cygdrive_dir in /cygdrive/*
do
	drive_name=$(basename $cygdrive_dir)

	ln -s "$cygdrive_dir" "/$drive_name"
done
