@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required (hosts file will be edited). Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
    ) else (
        echo Failure: Current permissions inadequate.
		pause >nul
		EXIT /B 1
    )

echo Making ca-certs
mkdir nginx-certs
cd nginx-certs
mkcert --install

echo copy ca-certs
copy %LOCALAPPDATA%\mkcert\rootCA.pem .\cacerts.pem
copy %LOCALAPPDATA%\mkcert\rootCA.pem .\cacerts.crt

set /p domainName=What domain will be used for application? Domain name will be used in 'hosts' and for creating dev-certificates (.kai.local will be used if left empty): 
IF "%domainName%"=="" (
    set domainName=kai.local
)

echo appending our domain to hosts file, will redirect to 127.0.0.1

set myDomainRedirect=127.0.0.1 %domainName% sts.%domainName% admin.%domainName% admin-api.%domainName% kaizen.%domainName%
type "%SystemRoot%\system32\drivers\etc\hosts" | find "%myDomainRedirect%" || (echo[ >>"%SystemRoot%\system32\drivers\etc\hosts" & echo[ >>"%SystemRoot%\system32\drivers\etc\hosts" & echo %myDomainRedirect%>>"%SystemRoot%\system32\drivers\etc\hosts")

echo creating certificates for domain %domainName%

mkcert -cert-file %domainName%.crt -key-file %domainName%.key %domainName% *.%domainName%
mkcert -pkcs12 %domainName%.pfx %domainName% *.%domainName%

set /p certPassword=creating pfx cert that can be used by Kestrel for ssl. pfx file requires key, please enter password for it (will be 'pass' if left empty): 
IF "%certPassword%"=="" (
    set certPassword=pass1
)

openssl pkcs12 -export -out %domainName%.pfx -inkey %domainName%.key -in %domainName%.crt -password pass:%certPassword%
cd ../

echo creating up / down batch scripts to simplify launch

Set "out=.\"
(
  Echo;SET DOMAIN_NAME=%domainName%
  Echo;SET CERT_PASS=%certPassword%
  Echo;docker-compose up -d
) > "%out%up.bat"

Set "out=.\"
(
  Echo;SET DOMAIN_NAME=%domainName%
  Echo;SET CERT_PASS=%certPassword%
  Echo;docker-compose down
) > "%out%down.bat"

echo replacing domain name in IdentityServer4 setup json. It will be later used by skoruba-admin image to fill identity database.

for /r ".\identity-init-data\" %%# in (identityserver*.json.template) do (
    call replacer.bat "%%~f#" "<domainName>"  "%domainName%"
)

cd .\identity-init-data
ren *json.template *.
cd ..\

echo Creating dhparam.pem for nginx to use Forward Secrecy.

mkdir nginx-dhparam
openssl dhparam -out ./nginx-dhparam/dhparam.pem 4096