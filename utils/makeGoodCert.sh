#!/bin/bash
openssl genrsa -out good.key 2048
openssl req -new -key good.key -out good.csr -subj "/C=US/ST=Massachusetts/L=Boston/O=Xamarin/OU=Runtime/CN=Testing/emailAddress=alexander.kyte@xamarin.com"
openssl x509 -req -in good.csr -CA ../../tmpCA.pem -CAkey ../../tmpCA.key -CAcreateserial -out good.crt -days 365 
openssl x509 -in good.crt -out good.pem -outform PEM
