FROM archlinux

# On install le serveur SSH

RUN pacman -Sy openssh --noconfirm 

# ON ajoute un user pour la connexion ssh

RUN useradd -m tplover

# On fait la config de SSH et recup les keys
#USER tplover

RUN ssh-keygen -A

RUN mkdir /home/tplover/.ssh/

COPY id_rsa.pub /home/tplover/.ssh/authorized_keys
#COPY sshd_config /etc/ssh/sshd_config --< pas oblige vu que cest la config par defaut

RUN chown tplover: /home/tplover/.ssh/ -R

# On recup le core script et le copie dans le conteneur
#USER root
COPY core.sh /home/tplover/
COPY ping_ip.sh /home/tplover/

# Definit l'entry point 
##(can write -D ou --nodaemon)
CMD ["/usr/sbin/sshd", "-D"]

