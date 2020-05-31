#!/bin/bash

IP=$(hostname -I)

echo '$IP' $IP

echo '${#IP}' ${#IP}

echo '${IP:4}' ${IP:4}

echo '${IP:4:3}' ${IP:4:3}

echo '${IP#*1}'  ${IP#*1}

echo  '${IP##*1}' ${IP##*1}

echo '${IP%*1}' ${IP%*1}

echo '${IP%1*}' ${IP%1*}

echo '${IP%%1*}' ${IP%%1*}

echo '${IP%%1*1*}' ${IP%%1*1*}

echo '${IP%1*1*}' ${IP%1*1*}

echo '${IP%%?1*1*}' ${IP%%?1*1*}

echo '${IP##*.}' ${IP##*.}

echo '${IP%.*}' ${IP%.*}

echo '${IP/1/X}' ${IP/1/X}

echo '${IP//1/X}' ${IP//1/X}

echo '${IP//[12345]/X}' ${IP//[12345]/X}

echo '${IP//?1/X}' ${IP//?1/X}

echo '${IP//?1/-}' ${IP//?1/-}








