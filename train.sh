
#########################################################################
# File Name: train.sh
# Author: 
# mail: 
# Created Time:   EDT
#########################################################################

#!/bin/bash
#!/usr/bin/env sh
PRETRAINED_MODEL=/root/caffenet_hybridcnn/hybridCNN_new_iter_700000.caffemodel
t=$(date +%Y-%m-%d_%H:%M:%S) # $ declare variable

FILENAME=caffenet_hybrid #change to your log file name

LOG=/root/caffenet_hybridcnn/new_training/DRD_$FILENAME.log  #log file direction

#create new log file
if [ ! -f "$LOG" ]; then  
    echo $LOG "is created"
    touch "$LOG"
    echo -e "\n" > $LOG
    echo "**********" >> $LOG
    echo "$t" >> $LOG
    echo "**********" >> $LOG
    echo -e "\n" >> $LOG
    GLOG_logtostderr=1 /root/caffe-master/build/tools/caffe train \
        --solver=/root/caffenet_hybridcnn/solver.prototxt \
        --weights=$PRETRAINED_MODEL \
        --gpu=all 2>&1 | tee -a $LOG
else
    echo $LOG "exists"
    echo -e "\n" >> $LOG
    echo "**********" >> $LOG
    echo "$t" >> $LOG
    echo "**********" >> $LOG
    echo -e "\n" >> $LOG
    GLOG_logtostderr=1 /root/caffe-master/build/tools/caffe train \
        --solver=/root/caffenet_hybridcnn/solver.prototxt \
        --weights=$PRETRAINED_MODEL \
        --gpu=all 2>&1 | tee -a $LOG
fi

