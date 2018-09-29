#!/bin/sh

echo -n "Generating $1.pem ... "
openssl req -new -nodes -utf8 -sha256 -days 36500 -batch -x509 \
	-config x509."$1".genkey -outform PEM -out "$1".pem \
	-keyout "$1".pem
sleep 1
echo "DONE."

echo -n "Changing permissions of $1.pem ... "
chmod 0660 "$1".pem
sleep 1
echo "DONE."

echo -n "Splitting $1.pem to $1.key and $1.crt ... "
openssl pkey -in "$1".pem -out "$1".key
openssl x509 -outform der -in "$1".pem -out "$1".crt
sleep 1
echo "DONE."
