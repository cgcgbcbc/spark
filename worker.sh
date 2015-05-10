#!/bin/sh
/spark/bin/spark-class org.apache.spark.deploy.worker.Worker  spark://master:7077

tail -F /spark/logs/spark*
