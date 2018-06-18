#!/bin/bash
USER_LIST=ldapuser.txt
HOME_ldap=/home/ldapuser
mkdir -pv $HOME_ldap
for USERID in `awk '{print $1}' $USER_LIST`; do
    USERNAME="`grep "$USERID" $USER_LIST | awk '{print $2}'`"
    HOMEDIR=${HOME_ldap}/${USERNAME}
    useradd $USERNAME -u $USERID -d $HOMEDIR
    grep "$USERID" $USER_LIST | awk '{print $3}' | passwd --stdin $USERNAME
done
