#! /bin/bash                                                                                                                                                                       
throttle=1
nkernels=1
# 1 through 5 for the throttles
# for i in {1..5}
for i in {1..2}
do
sleeptime=1000
    # 1 through 8 for the sleeptimes
    # for k in {1..8}
    for k in {1..5}
    do
	echo ""
	echo ""
	echo ""
	echo "Throttle count equals: " $throttle    
	echo "Sleeptime is equal to: " $sleeptime
	echo "The number of kernels: " $nkernels
	
	# run swift
	time swift -tc.file tc.data -sites.file sites/$throttle-throttle-sites.xml gpu.swift -nkernels=$nkernels -kernel_time=$sleeptime
	
        # double the sleeptime
	sleeptime=$(expr $sleeptime + $sleeptime)
    done
# increase the throttle
throttle=$(expr $throttle + 15)
done