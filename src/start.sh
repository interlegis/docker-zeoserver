#!/bin/bash

_terminate() {
  $ZEOHOME/bin/zeoctl stop
  kill -TERM $child 2>/dev/null
}

trap _terminate SIGTERM SIGINT


ZEOCONF=$ZEOHOME/etc/zeo.conf
tempstoragecheck() {
  if grep -xq "%import tempstorage" $ZEOCONF ; then
    echo "Temporary storage already configured."
  elif [ "${TEMPSTORAGE,,}" == "true" ]; then
      echo "
%import tempstorage
<temporarystorage temp>
  name temporary storage for sessioning
</temporarystorage>" >> $ZEOCONF
 
  fi
}

tempstoragecheck

$ZEOHOME/bin/zeoctl start
$ZEOHOME/bin/zeoctl logtail &

child=$!
wait "$child"
