FROM archlinux:base-devel

ARG TMP_USER_NAME="tmpuser"
ARG ROOT_PASSWORD="rootpassword"

ENV PATH /usr/local/bin:/usr/bin:/bin
ENV IS_DOCKER_CONTAINER Hello

# https://github.com/qutebrowser/qutebrowser/commit/478e4de7bd1f26bebdcdc166d5369b2b5142c3e2#diff-f5ac8dbaf3d87d762d99e75ab1fd15d13779d8c4dbc2c0504ebb64eaaf2783ee
RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
    curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
    bsdtar -C / -xvf "$patched_glibc"

# Download the pacman database files, update the pacman database and install essential pacckages
RUN pacman -Fy --noconfirm && pacman -Syu --noconfirm vi git openssh

# Add non-root user
RUN useradd -mG wheel $TMP_USER_NAME

# Allow using sudo without password
RUN sed -e "s/# \(%wheel.*NOPASSWD.*\)/\1/" /etc/sudoers | EDITOR=tee visudo >/dev/null

# Switch to non-root user
USER $TMP_USER_NAME

# Install yay
RUN cd && { \
  git clone https://aur.archlinux.org/yay.git; \
  cd yay; \
  export MAKEFLAGS="-j8"; \
  makepkg -si --noconfirm; \
}

USER root

# Disallow using sudo without password
RUN sed -e "s/\(%wheel.*NOPASSWD.*\)/# \1/" /etc/sudoers | EDITOR=tee visudo >/dev/null

RUN userdel -r $TMP_USER_NAME
