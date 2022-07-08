for i in {1..10}
do j=$((i*14))
mkdir GEOM_$i 
head -n $j initconds_QM.xyz | tail -n 14 > GEOM_$i/geom.xyz
done

