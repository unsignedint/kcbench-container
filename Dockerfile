FROM centos:7

RUN \ 
     yum -y groupinstall "development tools" \
  && yum -y install wget time bc ncurses-devel hmaccalc zlib-devel binutils-devel elfutils-libelf-devel \
  && wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.4.130.tar.xz \
  && tar xf linux*xz \
  && wget https://raw.githubusercontent.com/knurd/kcbench/master/kcbench \
  && chmod +x kcbench

ENTRYPOINT ["/bin/sh", "kcbench", "-s", "linux-4.4.130"]

