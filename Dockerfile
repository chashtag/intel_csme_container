FROM fedora:36

#RUN dnf install -y \
#    curl \
#  	&& dnf clean all \
#  	&& rm -rf /var/cache/yum

RUN mkdir /opt/csme && curl https://downloadmirror.intel.com/28632/CSME_Version_Detection_Tool_Linux.tar.gz -L -o - | tar -zxvf - -C /opt/csme 

ENTRYPOINT ["python3", "/opt/csme/intel_csme_version_detection_tool"]