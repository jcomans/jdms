FROM local:jdms-base

RUN yum -y update && \
    yum clean all && \
    yum -y install \
    xterm \
    wt-devel \
    tesseract-devel \
    boost-devel \
    clang clang-analyzer clang-tools-extra \
    make \
    cmake \
    bash \
    tmux \
    git \
    emacs && \
    cd /root && \
    ln -s /root/.emacs.d/lisp/.emacs

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

RUN chmod +x /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

