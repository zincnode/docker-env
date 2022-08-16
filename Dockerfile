FROM ubuntu

RUN apt-get update && apt-get install ca-certificates -y

RUN sed -i "s@http://.*archive.ubuntu.com@https://mirrors.bfsu.edu.cn@g" /etc/apt/sources.list && \
sed -i "s@http://.*security.ubuntu.com@https://mirrors.bfsu.edu.cn@g" /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y && apt-get autoremove -y 

RUN apt-get install apt-utils git wget curl neovim inxi ranger zsh -y

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&  usermod -s /bin/zsh root
