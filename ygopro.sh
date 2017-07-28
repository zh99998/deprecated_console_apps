#!/usr/bin/env bash
set -o errexit

echo -n 'Checking Version... '
YGOPRO_VERSION=`curl --location --retry 5 --silent https://api.github.com/repos/mycard/ygopro/releases/latest | jq -r .tag_name`
echo ${YGOPRO_VERSION}

for platform in darwin win32 linux
do
    for locale in zh-CN en-US
    do
        rm -rf /data/apps/ygopro-${platform}-${locale}
        mkdir /data/apps/ygopro-${platform}-${locale}
        if [ "${platform}" == "darwin" ]
        then
            platform_travis="osx"
        else
            platform_travis=${platform}
        fi
        curl --location --retry 5 "https://github.com/mycard/ygopro/releases/download/${YGOPRO_VERSION}/ygopro-${YGOPRO_VERSION}-${platform_travis}-${locale}.tar.gz" | tar --warning=no-unknown-keyword -zxf - -C /data/apps/ygopro-${platform}-${locale}
        ./build.sh ygopro-${platform}-${locale}
    done
done
exit
