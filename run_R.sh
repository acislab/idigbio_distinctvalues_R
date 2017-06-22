#!/bin/bash


export HADOOP_CONF_DIR="/etc/hadoop/conf"
export HADOOP_USER_NAME="hdfs"
/opt/spark/latest/bin/spark-submit \
--master mesos://zk://mesos02:2181,mesos01:2181,mesos:2181/mesos \
--driver-memory 1G \
--total-executor-cores 20 \
--executor-memory 3G \
r_job.R
