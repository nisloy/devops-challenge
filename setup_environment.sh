#!/usr/bin/env bash
set -e 

directories=(logs configs scripts)
files=(system.log app.conf backup.sh)
permissions=(644 444 755)
contents=("Amuza add some logs" "Amuza add some configs here also" 'echo "This is the backup bash"')

for i in "${!directories[@]}"; do 
	dir=${directories[$i]}
	path="$dir/${files[$i]}"

	if [[ -d "$dir" ]]; then
		echo "Directory already exists: $dir"

		if [[ -f "$path" ]]; then
			echo "File already exists: $path"
		else
			echo "${contents[$i]}" > "$path"
			echo "File created: $path"
		fi
	else
		mkdir "$dir"
		echo "Directory created: $dir"
		echo "${contents[$i]}" > "$path"
		echo "File created: $path"
	fi

	chmod "${permissions[$i]}" "$path"
	echo "Permission ${permissions[$i]} addedd on $path"
	echo
done

(tree)
ls -l */*
		
