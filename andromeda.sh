# get package count using grep and wc
pkgCount=$(grep -o -E '\w+' $1 | wc -l)

successCount=0
failCount=0
# iterate over all words in input file
for (( pkgNum=1; pkgNum<=$pkgCount-2; pkgNum++ )); do
    # use tr and cut to save individual package to variable
    pkg=$(tr -s "\n" " " < $1 | cut -d " " -f $pkgNum)
   
   # install the package if pkg isn't an empty variable
    if [ ! -z "$pkg" -a "$pkg" != " " ]; then 
        paru -S $pkg --noconfirm
        
        # check error code for success
        check=$(echo $?)
        if [ $check != 0 ]; then
            ((failCount++))
        elif [ $check == 0 ]; then
            ((successCount++))
        fi
    fi
done

# test colours
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# print successes and failures
if [ $successCount != 0 ] && [ $failCount = 0 ]; then
    printf "${BLUE}\nAll $successCount packages were installed successfully\n\n"
elif [ $failCount != 0 ] && [ $successCount = 0 ]; then
    printf "${YELLOW}\nAll $failCount package installation(s) failed\n\n"
else
    printf "${BLUE}\n$successCount packages were installed successfully"
    printf "${YELLOW}\n$failCount package installation(s) failed\n\n"
fi
