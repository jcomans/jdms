FROM fedora:29

RUN yum -y update && \
    yum clean all && \
    yum -y install wt wt-dbo wt-dbo-mysql tesseract boost

ENTRYPOINT ["/bin/bash"]
