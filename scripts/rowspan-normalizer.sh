#!/usr/bin/env bash

# MIT License
#
# Copyright (c) 2020 Tersine Mühendisler Odası
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Simple rowspan normalizer
#
#        before                        after
#  +--------+--------+          +--------+--------+
#  |  asd   |  fsdaf |          |  asd   |  fsdaf |
#  +        +--------+   --->   +--------+--------+
#  |        | asdffsa|          |        | asdffsa|
#  +--------+--------+          +--------+--------+
#
# Usage: ./rowspan-normalizer.sh bla.html
#
# Requirements: GNU sed
#               Roughly beautified html as input
#
# Thanks to all rondom internet guys for random helps on sed and the others

set -eu

FILE=$1
CTR=0

# ehe, i hope you don't use rowspan word in your body text
while (grep "td rowspan" $FILE) ; do
        # get rowspan value encountered first; and it's line number
        ROWSPANVAL=$(grep "rowspan" $FILE | grep -o '[0-9]\+' | head -n 1)
        ROWSPANLINENR=$(grep -n "rowspan" $FILE | grep -o '[0-9]\+' | head -n 1)

        # split file into two from "rowspan" keyword
        head -n $(($ROWSPANLINENR - 1)) $FILE > "$FILE.head"
        tail --lines=+$ROWSPANLINENR $FILE > "$FILE.tail"

        # place an empty row for each "spanned" row - 1 (itself)
        for i in $(seq $(($ROWSPANVAL-1)) -1 1); do
                sed -z -i "s/<tr>/<tr>\n<td><\/td>/$i" $FILE.tail
        done

        # remove the FIRST "rowspan" keyword
        # by sed magic that you'll forget how it was working after 30 seconds
        # you wrote it
        sed -E -i "1s/(<td rowspan.*)(.*>)(.*.)(<\/td>)/<td>\3<\/td>/" $FILE.tail

        # write back to file
        cat "$FILE.head" "$FILE.tail" > $FILE

        # remove artifacts
        rm $FILE.head $FILE.tail
        CTR=$(($CTR + 1))

        # break infinite loop heuristically
        if [ "$CTR" -gt "300" ]; then
                echo "Deadlock break"
                break
        fi
done

echo "Normalized $CTR rowspans. See you tomorrow."
