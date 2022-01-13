FROM postgres
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD docker
ENV POSTGRES_DB dealership
COPY section2.sql /docker-entrypoint-initdb.d/