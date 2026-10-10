#!/usr/bin/env bash
directories=(logs configs scripts)
for dir in "${directories[@]}"; do 
	if [[ $dir == "logs" ]]; then
		(mkdir logs && cd logs && touch system.log && echo "Amuza add some logs">system.log)
	elif [[ $dir == "configs" ]]; then 
		(mkdir configs && cd configs && touch app.conf && echo "Amuza add some lconfigs here also">app.conf)
	else

		(mkdir scripts && cd scripts && touch backup.sh && echo "This is the backup bash">app.conf)
	fi
done
		
		
