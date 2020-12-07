FROM centos
WORKDIR /vscode
RUN dnf update -y && \
    curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && \
    dnf module enable nodejs:12 -y && \
    dnf --enablerepo=PowerTools install git nodejs python3 make libX11-devel gcc-c++ libsecret-devel libxkbfile-devel yarn -y && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    git clone --depth 1 https://github.com/microsoft/vscode.git . && \
    yarn && \
    yarn compile-web
EXPOSE 80
EXPOSE 81
COPY ./service.sh .
CMD [ "/bin/sh", "/vscode/service.sh" ]
