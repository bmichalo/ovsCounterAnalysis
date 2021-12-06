#!/bin/bash

inputFile=$1
outfile="${inputFile}.drops.CSV.tmp"

grep -A 12 "ovs-ofctl dump-ports " $1 > step1.txt
sed -i '/ovs-ofctl dump-ports <bridge>/,+2d' step1.txt
sed '/ofport/d' step1.txt | sed '/--/d' | sed '/^$/d' | sed '/rx pkts/d' > step2.txt
sed -i '/OFPST_PORT/,+1d' step2.txt
sed -i 's/tx pkts.*drop//' step2.txt
sed -i 's/errs.*//' step2.txt

mv step2.txt "${outfile}"

