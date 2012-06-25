#!/bin/sh
chmod a+x run.sh
chmod a+x ./echo*/priv/cli*
chmod a+x ./make.escript
FILE="`basename echo-*`""/ebin"
./make.escript $FILE