#!/bin/bash
inputFile=$1
outfile="${inputFile}.drops.RESULTS.CSV"

sed -i '/^$/d' "${inputFile}"
sed -i 's/\:.*\=/\, /' "${inputFile}"
awk '/^ovs/{printf "%s,",$0;next}7' "${inputFile}" > tmp.txt
awk '/^ovs/{printf "%s",$0;next}7' tmp.txt > tmp1.txt
sed -i 's/ovs-ofctl dump-ports //' tmp1.txt
mv tmp1.txt "${outfile}"
