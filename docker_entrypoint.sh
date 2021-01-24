#!/bin/bash
set -e

if [[ "$*" == npm*start* ]]; then
	baseDir="content"
	for dir in "$baseDir"/*/ "$baseDir"/themes/*/; do
		targetDir="$GHOST_CONTENT/${dir#$baseDir/}"
		mkdir -p "$targetDir"
		if [ -z "$(ls -A "$targetDir")" ]; then
			tar -c --one-file-system -C "$dir" . | tar xC "$targetDir"
		fi
	done

  chown -R node "$GHOST_CONTENT"

	set -- gosu user "$@"
fi

echo "$@" > test.log
exec "$@"
