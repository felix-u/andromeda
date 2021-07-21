# Iterate over all words in input file
pkgCount=$(grep -o -E '\w+' $1 | wc -l)
for (( pkgNum=1; pkgNum<=$pkgCount-2; pkgNum++ ))
do
    #line=$(awk -v pkgNum=$pkgNum 'FNR==pkgNum {print $0}' $1)
    # Replace all whitespace with one space and use cut to save individual package to variable
    pkg=$(tr -s "\n" " " < $1 | cut -d " " -f $pkgNum)
    paru -S $pkg --noconfirm
done
