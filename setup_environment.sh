#!/usr/bin/env bash
directories=(logs configs scripts)
for dir in "${directories[@]}"; do 
	if [[ $dir == "logs" ]]; then
		(mkdir logs && cd logs && touch system.log && echo "Amuza add some logs">system.log)
		if [[ -d "logs" ]]; then 
			(chmod  644 logs/*)
		fi
	elif [[ $dir == "configs" ]]; then 
		(mkdir configs && cd configs && touch app.conf && echo "Amuza add some lconfigs here also">app.conf)
		if [[ -d  "configs" ]]; then 
			(chmod  444 configs/*)
		fi
	else

		(mkdir scripts && cd scripts && touch backup.sh && echo "This is the backup bash">backup.sh)
		if [[ -d "scripts" ]]; then 
			(chmod 755 scripts/*)
		fi
	fi
done
(tree)
(ls -l */*) # alternatively we can display reuslts using ls -lR (This works recursively it will show all itesm in folder:)
		
