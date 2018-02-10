FROM centos

RUN for i in $(seq 0 99); do dd if=/dev/urandom of=/tmp/read-$(printf %03d $i) count=4096; done

ADD files/root /

ENTRYPOINT [ "/test.sh" ]
