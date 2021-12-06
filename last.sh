#!/bin/bash
inputFile=$1
outfile="${inputFile}.drops.CSV"
tmp_outfile="${inputFile}.drops.CSV.tmp"

sed -i '/^$/d' "${tmp_outfile}"
sed -i 's/\:.*\=/\, /' "${tmp_outfile}"
awk '/^ovs/{printf "%s,",$0;next}7' "${tmp_outfile}" > tmp.txt
awk '/^ovs/{printf "%s",$0;next}7' tmp.txt > tmp1.txt
sed -i 's/ovs-ofctl dump-ports //' tmp1.txt
mv tmp1.txt "${outfile}"
