#!/bin/bash - 
#===============================================================================
#
#          FILE: run.sh
# 
#         USAGE: ./run.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Aijun Bai (), 
#  ORGANIZATION: 
#       CREATED: 01/15/2017 10:37
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

SIZE="5"
PLT="plot.gnuplot"

make clean
make release
mkdir data
cd data

cp ../${PLT} .
for alg in H HS; do
    time ../maxq_op -n $SIZE -Mt -${alg} > ${alg}.out
    echo "'${alg}.out' w l, \\" >> ${PLT}
done

gnuplot -p ${PLT}

