#!/bin/sh
/spark/sbin/start-master.sh -h $HOSTNAME
tail -F /spark/logs/spark*
