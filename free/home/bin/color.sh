#!/bin/sh
getcol ()
{
   for NUM in {0..15}
   do
      col[$NUM]=$(xrdb -query | grep "^\*color${NUM}:" | cut -d '#' -f2)
   done

   read col[16] col[17] <<< $(xrdb -query | grep -E "(back|fore)ground" | cut -d '#' -f2)
}

getcol
   case $1 in
      blkf) echo "${col[0]}";;
      redf) echo "${col[1]}";;
      grnf) echo "${col[2]}";;
      ylwf) echo "${col[3]}";;
      bluf) echo "${col[4]}";;
      magf) echo "${col[5]}";;
      cynf) echo "${col[6]}";;
      whtf) echo "${col[7]}";;
      blkb) echo "${col[8]}";;
      redb) echo "${col[9]}";;
      grnb) echo "${col[10]}";;
      ylwb) echo "${col[11]}";;
      blub) echo "${col[12]}";;
      magb) echo "${col[13]}";;
      cynb) echo "${col[14]}";;
      whtb) echo "${col[15]}";;
        bg) echo "${col[16]}";;
        fg) echo "${col[17]}";;
         *) echo "${col[*]}";;
   esac
exit 0
