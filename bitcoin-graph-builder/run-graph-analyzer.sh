#!/usr/bin/env bash

# Helper script to run with a local Spark/HDFS setup
# To run it, simply place the "raw-btc-transactions" directory into the "test-data" directory.
$SPARK_HOME/bin/spark-submit \
    --master "local[*]" \
    --total-executor-cores 5 \
    --driver-memory 2g \
    --executor-memory  10g \
    --name GraphAnalyzer \
    --class edu.columbia.eecs6893.btc.graph.GenericGraphAnalysis \
    ./target/scala-2.12/bitcoin-graph-builder-assembly-1.0.jar \
    -e test-data/address-graph/edges \
    -v test-data/address-graph/nodes \
    -o test-data/address-graph-coefficient \
    -g 1 \
    -t 4

