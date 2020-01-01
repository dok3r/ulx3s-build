FROM dok3r/diamond:v3.7

ENV ULX3S_URL=https://github.com/alpin3/ulx3s/releases/download/v2019.12.30/ulx3s-2019.12.30-linux-x86_64.tar.gz \
 PATH=/opt/ulx3s/bin:$PATH

RUN yum update -y ; \
 yum install -y python3 zip unzip make git which && \
 curl -L $ULX3S_URL | tar -xvz -C /opt -f - && \
 ln -sf /opt/ulx3s-* /opt/ulx3s && \
 wget https://gist.githubusercontent.com/kost/2dd08b4dc9c1ada642daf55f9ccc0402/raw/0f907338fface12afa79fb19842bbae94e3144e2/ulx3s_buildenv.sh -O /opt/ulx3s/bin/ulx3s_buildenv.sh && \
 chmod +x /opt/ulx3s/bin/ulx3s_buildenv.sh && \
 /opt/ulx3s/bin/ulx3s_buildenv.sh && \
 echo "[Success]"

ENTRYPOINT ["/bin/bash"]
