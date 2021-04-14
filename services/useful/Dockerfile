FROM base-yay

ARG USER_NAME
ARG USER_HOME=/docker_home/$USER_NAME

ARG HOST_HOME
ENV HOST_HOME=$HOST_HOME

RUN if [ -z "$USER_NAME" ]; then { echo "\$USER_NAME is required!"; false; }; fi
RUN if [ -z "$HOST_HOME" ]; then { echo "\$HOST_HOME is required!"; false; }; fi

# Allow using sudo without password
RUN sed -e "s/# \(%wheel.*NOPASSWD.*\)/\1/" /etc/sudoers | EDITOR=tee visudo >/dev/null

# Add non-root user
RUN useradd -d $USER_HOME -mG wheel $USER_NAME

USER $USER_NAME

# Update pacman database and install packages
RUN yay -Syu --needed --noconfirm \
  neovim \
  neofetch \
  tree \
  htop \
  starship-bin \
  fish \
  time \
  lua \
  ruby \
  lsof \
  man-db \
  man-pages \
  whois \
  httpie \
  zip \
  unzip \
  yarn

COPY --chown=$USER_NAME:$USER_NAME ./services/useful/scripts $USER_HOME/scripts

WORKDIR $USER_HOME

RUN mkdir github

# Install dotfiles
RUN ~/scripts/dotfiles.sh

# Install PureScript
RUN ~/scripts/purescript.sh

# Install vim-plug
RUN ~/scripts/vim-plug.sh

# Install language servers
RUN ~/scripts/languageserver.sh

# Make symbolic link to config files in the host
RUN ~/scripts/link-config.sh

WORKDIR $HOST_HOME
