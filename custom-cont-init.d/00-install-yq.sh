#!/usr/bin/with-contenv bash
# Installs yq

if [ $(arch) == "aarch64" ]; then
    ARCH="arm64"
elif [ $(arch) == "armv7l" ]; then
    ARCH="arm"
elif [ $(arch) == "x86_64" ]; then
    ARCH="amd64"
else
    echo "Unsupported architecture: $(arch)"
    exit 1
fi

curl https://github.com/mikefarah/yq/releases/download/3.4.1/yq_linux_${ARCH} --silent --location --output /usr/local/bin/yq
chmod +x /usr/local/bin/yq
/usr/local/bin/yq --version
