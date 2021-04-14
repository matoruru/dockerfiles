FROM archlinux:base-devel

ARG TMP_USER_NAME="tmpuser"
ARG ROOT_PASSWORD="rootpassword"

ENV PATH /usr/local/bin:/usr/bin:/bin

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
