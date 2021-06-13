#!/usr/bin/awk -f
# By Migdal
# https://stepik.org/lesson/541851/step/2?unit=535312
function printArray(arr)
{
  i=1 ;
  while(arr[i] != "") {
    printf("%s", arr[i]) ;
    i++ ;
  } 
  print "" ;
}

function printArrayTr(arr, dict)
{
  i=1 ;
  while(arr[i] != "") {
    printf("%s ", dict[arr[i]]) ;
    i++ ;
  } 
  print "" ;
}

function lenArray(arr)
{
  len=0 ;
  for(i in arr) len++ ;
  return len ;
}

function getArrayStates(arr, ncol, states)
{
  return states ;
}


BEGIN { FS=" " ; OFS=" " ; j=0 ; }
{
if(NR > 1){
  if(NF == 2 && NR > 2) {
    j=0 ;
    ncol=lenArray(arr) ;
    s=1 ;
    for(i=1; i <= ncol; i++) {
      if(states[arr[i]] == "") { states[arr[i]]=s ; s++ ; }
    }
    print s - 1 ;
    printArrayTr(arr, states) ; 
    delete arr ; delete states ;
  } else if(NF == 1) {
    i=1 ; a=substr($1, i, 1) ;
    while(a != "") {
      arr[i]=arr[i] + a * 2^j ;
      i++ ; a=substr($1, i, 1) ;
    }
    j++
  }   
}
}
END { 
  ncol=lenArray(arr) ;
  s=1 ;
  for(i=1; i <= ncol; i++) {
    if(states[arr[i]] == "") { states[arr[i]]=s ; s++ ; }
  }
  print s - 1 ;
  printArrayTr(arr, states) ; 
}
