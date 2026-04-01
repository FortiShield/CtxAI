# Use the latest slim version of Kali Linux
FROM kalilinux/kali-rolling


# Set locale to en_US.UTF-8 and timezone to UTC
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales tzdata
RUN sed -i -e 's/# \(en_US\.UTF-8 .*\)/\1/' /etc/locale.gen && \
    locale-gen && \
    echo 'LANG=en_US.UTF-8' > /etc/default/locale && \
    echo 'LANGUAGE=en_US:en' >> /etc/default/locale && \
    echo 'LC_ALL=en_US.UTF-8' >> /etc/default/locale
RUN ln -sf /usr/share/zoneinfo/UTC /etc/localtime
RUN echo "UTC" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
ENV TZ=UTC

# Copy contents of the project to /
COPY docker/base/fs/ /

# install packages software (split for better cache management)
RUN bash /ins/install_base_packages1.sh
RUN bash /ins/install_base_packages2.sh
RUN bash /ins/install_base_packages3.sh
RUN bash /ins/install_base_packages4.sh

# install python after packages to ensure version overriding
RUN bash /ins/install_python.sh

# install searxng
RUN bash /ins/install_searxng.sh

# configure ssh
RUN bash /ins/configure_ssh.sh

# after install
RUN bash /ins/after_install.sh

# Keep container running infinitely
CMD ["tail", "-f", "/dev/null"]
