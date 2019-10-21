declare -A jumpmap
if [ -z "$1" ]
then
  set "/etc/profile.d/jump.d/jumpmap"
fi

while read line; do
  k="$(cut -d':' -f1 <<< $line)"
  v="$(cut -d':' -f2 <<< $line)"
  jumpmap[$k]=$v
done < $1

j()
{
  if [ -z "$1" ]
  then
    echo "No argument supplied."
  else
    if [ -z "${jumpmap[$1]}" ]
    then 
      echo "jump not defined :("
    else
      cd ${jumpmap[$1]}
    fi
  fi
}

v()
{
  if [ -z "$1" ]
  then
    echo "No argument supplied."
  else
    if [ -z "${jumpmap[$1]}" ]
    then
      echo "jump not defined :("
    elif [ -f "${jumpmap[$1]}" ]
    then
      vim ${jumpmap[$1]}
    else
      echo "${jumpmap[$1]} is not a file"
    fi
  fi
}
