FROM ubuntu

RUN apt-get update && apt-get install ca-certificates -y && \
sed -i "s@http://.*archive.ubuntu.com@https://mirrors.bfsu.edu.cn@g" /etc/apt/sources.list && \
sed -i "s@http://.*security.ubuntu.com@https://mirrors.bfsu.edu.cn@g" /etc/apt/sources.list && \
apt-get update && apt-get upgrade -y && apt-get autoremove -y && \
apt-get install apt-utils git cmake gcc g++ ninja-build clang lld wget curl neovim inxi ranger zsh fd-find -y

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# RUN wget https://mirrors.bfsu.edu.cn/anaconda/archive/Anaconda3-2022.05-Linux-x86_64.sh && \
# bash Anaconda3-2022.05-Linux-x86_64.sh -b -p /root/anaconda3 && \
# echo "export PATH="/root/anaconda3/bin:$PATH"" | tee -a /root/.zshrc

# ENV PATH="/root/anaconda3/bin:$PATH"

# RUN conda update --all
CMD zsh
