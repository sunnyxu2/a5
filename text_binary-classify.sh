#!/bin/bash

cd $1
export CLASSPATH=$CLASSPATH:`pwd`/weka.jar:`pwd`/libsvm.jar
java weka.core.converters.TextDirectoryLoader -dir $2 > $2.arff
java -Xmx1024m weka.filters.unsupervised.attribute.StringToWordVector -i $2.arff -o $2-TRAIN.arff
java -Xmx1024m weka.classifiers.meta.ClassificationViaRegression -W weka.classifiers.trees.M5P -num-decimal-places 4 -t $2-TRAIN.arff -d $2-TRAIN.model -c 1
