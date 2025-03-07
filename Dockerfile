FROM ubuntu:22.04

# Mise à jour de packages
RUN apt update && apt upgrade -y

# Installation des outils de base
RUN apt-get install curl gpg iputils-ping nmap nikto -y

# Installation de HTTPie
RUN curl -SsL https://packages.httpie.io/deb/KEY.gpg | gpg --dearmor -o /usr/share/keyrings/httpie.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/httpie.gpg] https://packages.httpie.io/deb ./" | tee /etc/apt/sources.list.d/httpie.list > /dev/null

RUN apt-get update

RUN apt-get install httpie -y

# Installation de Taskfile
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/
RUN mv ~/.local/task /usr/bin/task

# Répertoire de travail
WORKDIR /root