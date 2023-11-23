FROM archlinux

RUN mkdir -p /doss/BDD
RUN touch /doss/BDD/bdd.csv

COPY make_index.sh /doss
COPY sentinelle.sh /doss

CMD ["bash","/doss/sentinelle.sh"]
