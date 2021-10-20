#!/bin/bash

# $excluded is a regex for paths to exclude from line counting
excluded=".travis\|assets\|tests\|spec\|node_modules\|README\|lib\|docs\|csv\|XLS\|json\|png\|.git"

countLines(){
  # $total is the total lines of code counted
  total=0
  # -mindepth exclues the current directory (".")
  for file in `find . -mindepth 1 -name "*.*" |grep -v "$excluded"`; do
    # First sed: only count lines that are not between elm comments {--}
    # Second sed: only count lines of code that are not commented with //
    # Third sed: don't count blank lines
    # Forth sed: don't count comments between /**/
    # $numLines is the lines of code
    numLines=`cat $file | sed '/^{-/,/^-}/d' | sed '/\/\//d' | sed '/^\s*$/d' | sed '/^\/\*/,/\*\//d' |wc -l`
    total=$(($total + $numLines))
    echo "  " $numLines $file
  done
  echo "  " $total in total
}

echo Source code files:
countLines
echo Unit tests:
cd tests
countLines
