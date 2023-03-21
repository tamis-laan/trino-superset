#! /bin/bash

trino --server http://localhost:9090 --execute "SHOW CATALOGS;"
trino --server http://localhost:9090 --execute "SHOW TABLES FROM postgresql.public;"
trino
