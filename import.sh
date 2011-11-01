#!/bin/sh

ruby gen_sql.rb

USER=root
DB=test1
MYSQL_BIN="mysql -u $USER $DB"

echo "start import."

$MYSQL_BIN < tables.sql

time $MYSQL_BIN < categories.sql
time $MYSQL_BIN < authors.sql
time $MYSQL_BIN < books.sql

echo "end import."
