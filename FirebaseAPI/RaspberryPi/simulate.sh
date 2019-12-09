#!/bin/bash

range=25
number=$((RANDOM % range))

for ((run=1; run <= number; run++)); do
   python3 state_pattern.py
done

#maxdelay=$((18*60))  # 18 hours from 6am to 12am, converted to minutes
#for ((i=1; i<= number; i++)); do
 #   delay=$(($RANDOM%maxdelay)) # pick an independent random delay for each of$
  #  (sleep $((delay*60));
   #  python3 state_pattern.py) & # background a subshell to wait, then run the$
#done


