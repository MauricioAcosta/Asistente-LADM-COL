#!/bin/bash
# rationale: se busca la ruta del script para que no importe desde
# donde se ejecuta el .sh
# link: https://stackoverflow.com/questions/630372/determine-the-path-of-the-executing-bash-script
MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
cd "$MY_PATH"
DB_BACKUP=$1
# rationale: Standard output is silenced and only error occurrences are shown
# link: https://unix.stackexchange.com/questions/119648/redirecting-to-dev-null
PGPASSWORD=docker psql -h postgres -U docker -d ladm_col --command='CREATE EXTENSION IF NOT EXISTS "uuid-ossp"' > /dev/null 2>&1
PGPASSWORD=docker psql -h postgres -U docker -d ladm_col -f sql/$DB_BACKUP > /dev/null 2>&1