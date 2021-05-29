# Using names.txt (right click and 'Save Link/Target As...'), 
# a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. 
# Then working out the alphabetical value for each name, multiply this value by its alphabetical position 
# in the list to obtain a name score.
# For example, when the list is sorted into alphabetical order, COLIN, 
# which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. 
# So, COLIN would obtain a score of 938 × 53 = 49714.
# What is the total of all the name scores in the file?

# read the list, split it into lines on comma, then sort it
names=`cat names.txt | sed -e $'s/,/\\\n/g' | sort`

sum=0
idx=1
for name in $names; do
    # suck in each character in the string, separated by newlines
    chars=`grep -o . <<< $name`
    inner_sum=0
    for char in $chars; do
        # find the ASCII ordinal of this letter
        # echo the character, strip the newline, pipe to `od` to print as an unsigned char
        # if I were concerned about low performance I would start here, but eh, this is for fun :)
        ord=`echo $char | tr -d "\n" | od -An -t uC`
        # subtract 64 from the ASCII value to get the letter's ordinal position in the alphabet
        ord_offset=$(($ord-64))
        # ignore any of the quotation marks left over in the file since we didn't get rid of them earlier
        if [[ $ord_offset -gt 0 ]]
        then
            inner_sum=$(($inner_sum+$ord_offset))
        fi       
    done
    inner_sum=$(($inner_sum*$idx))
    sum=$(($sum+$inner_sum))
    idx=$(($idx+1))
done

echo $sum