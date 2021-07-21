# Iterate over all words in input file
pkgCount=$(grep -o -E '\w+' $1 | wc -l)
for (( pkg=1; pkg<=$pkgCount; pkg++ ))
do
    awk -v pkg=$pkg 'FNR==pkg {print $0}' $1
done
