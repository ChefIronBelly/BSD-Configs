#!/usr/pkg/bin/mksh
 
echo
 
for n in '0' '1' '2' '3' '4' '5' '6';
  do
  for BG in 41m 42m 43m 44m 45m 46m 47m;
    do echo -ne "$EINS\033[$BG    \033[0m";
  done
  echo;
done

echo
