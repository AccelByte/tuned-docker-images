FROM scratch
LABEL maintainer "operations@accelbyte.net"

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8

ADD *.tar.gz .

RUN apk add --update --no-cache curl \
    vim \
    bind-tools \
    tcpdump \
    netcat-openbsd

RUN mkdir /etc/security; \
    echo "* - nofile 65535" > /etc/security/limits.conf;  \
    echo "* - memlock unlimited" >> /etc/security/limits.conf;  \
    echo "* - stack unlimited" >> /etc/security/limits.conf;  \
    echo vm.max_map_count=262144 >> /etc/sysctl.conf;  \
    echo vm.swappiness=0 >> /etc/sysctl.conf; \
    echo net.ipv6.conf.all.disable_ipv6=1 >> /etc/sysctl.conf;  \
    echo net.ipv6.conf.default.disable_ipv6=1 >> /etc/sysctl.conf;  \
    echo net.ipv6.conf.lo.disable_ipv6=1 >> /etc/sysctl.conf; \
    echo net.ipv4.ip_forward=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.all.accept_source_route=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.lo.accept_source_route=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.eth0.accept_source_route=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.default.accept_source_route=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.all.rp_filter=1 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.lo.rp_filter=1 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.eth0.rp_filter=1 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.default.rp_filter=1 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.all.accept_redirects=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.lo.accept_redirects=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.eth0.accept_redirects=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.default.accept_redirects=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.all.log_martians=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.lo.log_martians=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.eth0.log_martians=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.all.accept_source_route=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.lo.accept_source_route=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.eth0.accept_source_route=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.default.accept_source_route=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.all.rp_filter=1 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.lo.rp_filter=1 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.eth0.rp_filter=1 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.default.rp_filter=1 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.all.accept_redirects=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.lo.accept_redirects=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.eth0.accept_redirects=0 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.default.accept_redirects=0 >> /etc/sysctl.conf; \
    echo kernel.sysrq=0 >> /etc/sysctl.conf; \
    echo net.ipv4.tcp_fin_timeout=15 >> /etc/sysctl.conf; \
    echo net.ipv4.tcp_keepalive_time=1800 >> /etc/sysctl.conf; \
    echo net.ipv4.tcp_window_scaling=0 >> /etc/sysctl.conf; \
    echo net.ipv4.tcp_sack=0 >> /etc/sysctl.conf; \
    echo net.ipv4.tcp_timestamps=0 >> /etc/sysctl.conf; \
    echo net.ipv4.tcp_syncookies=1 >> /etc/sysctl.conf; \
    echo net.ipv4.icmp_echo_ignore_broadcasts=1 >> /etc/sysctl.conf; \
    echo net.ipv4.icmp_ignore_bogus_error_responses=1 >> /etc/sysctl.conf; \
    echo net.ipv4.conf.all.log_martians=1 >> /etc/sysctl.conf; \
    echo net.ipv4.tcp_max_syn_backlog=1024 >> /etc/sysctl.conf; \
    echo net.ipv4.tcp_max_tw_buckets=1440000 >> /etc/sysctl.conf

CMD ["/bin/sh"]
