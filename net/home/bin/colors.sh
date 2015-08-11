#!/usr/pkg/bin/bash
 
echo
 
for n in '0' '1' '2' '3' '4' '5' '6';
  do
  for BG in 47m 43m 46m 42m 45m 41m 44m;
    do echo -ne "$EINS\033[$BG    \033[0m";
  done
  echo;
done

echo