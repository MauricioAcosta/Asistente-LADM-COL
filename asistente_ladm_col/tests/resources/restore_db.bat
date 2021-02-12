REM This hasn't been tested extensively. Be careful with it :) 
set PGPASSWORD=docker
path C:\Program Files\PostgreSQL\10\bin;%PATH%
set DB_BACKUP = %1

psql -h postgres -U docker -d ladm_col --command='CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'
psql -h postgres -U docker -d ladm_col -f sql/%DB_BACKUP%