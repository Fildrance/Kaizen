FROM postgres:alpine3.19

ADD ./scripts/init-keycloak-role.sql /docker-entrypoint-initdb.d/
ADD ./scripts/init-db-and-app-user.sql /docker-entrypoint-initdb.d/
ENV POSTGRES_PASSWORD=mysecretpassword

ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 5432
CMD ["postgres"]