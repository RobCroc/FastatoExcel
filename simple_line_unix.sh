(echo "ID,Sequence"; awk '/^>/{if (seq) print id","seq; id=substr($0,2); seq=""; next} {seq=seq $0} END{if (seq) print id","seq}') input.fasta > output.csv
