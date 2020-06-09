
#########################################################################
# File Name: recovery.sh
# Author: 
# mail: 
# Created Time:   EDT
#########################################################################

#!/bin/bash
#!/usr/bin/env sh
SNAP_SHOT=/root/caffenet_hybridcnn/log_model/googlenet_bvlc_iter_30750.solverstate
t=$(date +%Y-%m-%d_%H:%M:%S) # $ declare variable

FILENAME=caffenet_hybrid #change to your log file name

LOG=/root/caffenet_hybridcnn/new_training/DRD_recovery_$FILENAME.log  #log file direction

#create new log file
if [ ! -f "$LOG" ]; then  
    echo $LOG "is created"
    touch "$LOG"
    echo "**********" > $LOG
    echo "$t" >> $LOG
    echo "Recovery Model Train" >> $LOG
    echo "Recovery File is $SNAP_SHOT" >> $LOG
    echo "**********" >> $LOG
    #echo -e "\n" >> $LOG
    GLOG_logtostderr=1 /root/caffe-master/build/tools/caffe train \
       --solver=/root/caffenet_hybridcnn/solver.prototxt \
       --snapshot=$SNAP_SHOT \
       --gpu=all 2>&1 | tee -a $LOG
else
    echo $LOG "exists"
    echo -e "\n" >> $LOG
    echo "**********" >> $LOG
    echo "$t" >> $LOG
    echo "Recovery Model Train" >> $LOG
    echo "Recovery File is $SNAP_SHOT" >> $LOG
    echo "**********" >> $LOG
    echo -e "\n" >> $LOG
    GLOG_logtostderr=1 /root/caffe-master/build/tools/caffe train \
       --solver=/root/caffenet_hybridcnn/solver.prototxt \
       --snapshot=$SNAP_SHOT \
       --gpu=all 2>&1 | tee -a $LOG
fi
