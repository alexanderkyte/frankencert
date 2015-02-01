#!/bin/bash
openssl genrsa -out good.key 2048
openssl req -new -key good.key -out good.csr -subj "/C=US/ST=Massachusetts/L=Boston/O=Xamarin/OU=Runtime/CN=localhost/emailAddress=alexander.kyte@xamarin.com"
openssl x509 -req -in good.csr -CA ../../tmpCA.pem -CAkey ../../tmpCA.key -CAcreateserial -out good.crt -days 365 
openssl x509 -in good.crt -out good_crt.pem -outform PEM

cat good_crt.pem >> good.pem
cat good.key >> good.pem

openssl pkcs12 -export -out good.pfx -inkey good.pem -in good.pem -certfile ../../rootCA.pem -passout pass:
