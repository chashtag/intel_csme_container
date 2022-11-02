FROM fedora:36

RUN dnf install -y \
    curl \
	git \
	make \
	pciutils-devel \
	pciutils \
	zlib-devel \
	zlib \
	gcc \
  	&& dnf clean all \
  	&& rm -rf /var/cache/yum

RUN mkdir /opt/csme && curl https://downloadmirror.intel.com/28632/CSME_Version_Detection_Tool_Linux.tar.gz -L -o - | tar -zxvf - -C /opt/csme 

RUN git clone https://github.com/coreboot/coreboot.git && cd coreboot/util/intelmetool && make && make install && cd && rm -rf coreboot

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]