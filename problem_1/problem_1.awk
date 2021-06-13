#!/usr/bin/awk -f
# By Migdal
# https://stepik.org/lesson/541851/step/2?unit=535312
BEGIN { FS=" " ; OFS=" " ; j=0 ; }
{
if(NR > 1){
  if(NF == 2 && NR > 2) {
    j=0 ;
    ncol=$2 ;
    for(i=1; i <= ncol; i++) printf("%s", arr[i]) ; print "" ;
    delete arr ;
  } else if(NF == 1) {
    for(i=1; i <= length($1); i++) {
      a = substr($1, i, 1) ;
      arr[i] = arr[i] + a * 2^j ;
    }
    j++
  }   
}
}
END { for (i=1; i <= ncol; i++) printf("%s", arr[i]) ; print "" }
