if [ ! -d "/etc/profile.d/jump.d" ]
then
  mkdir "/etc/profile.d/jump.d"
fi
cp jump.sh /etc/profile.d/.
cp jumpmap /etc/profile.d/jump.d/. 
