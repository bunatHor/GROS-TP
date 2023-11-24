FROM archlinux

# On install le serveur SSH

RUN pacman -Sy openssh diffutils --noconfirm 

# ON ajoute un user pour la connexion ssh

RUN useradd -m tplover -u 1000

# On fait la config de SSH et recup les keys
#USER tplover

RUN ssh-keygen -A

RUN mkdir /home/tplover/.ssh/

RUN mkdir /lecture
RUN chown tplover: /lecture
RUN chmod -R 775 /lecture

COPY id_rsa.pub /home/tplover/.ssh/authorized_keys
RUN chmod 544 /home/tplover/.ssh/authorized_keys
#COPY sshd_config /etc/ssh/sshd_config --< pas oblige vu que cest la config par defaut

RUN chown tplover: /home/tplover/.ssh/ -R

# On recup le core script et le copie dans le conteneur
#USER root
COPY core.sh /home/tplover/core.sh
COPY ping_ip.sh /ping_ip.sh
COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

# Definit l'entry point 
##(can write -D ou --nodaemon)
CMD ["/usr/sbin/sshd", "-D"]

