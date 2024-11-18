FROM patroni

USER root

RUN apt-get update\
    && apt-get install -y python3-pip \
    python3-venv \
    postgresql-plpython3-16 \
    postgresql-server-dev-16 \
    pgxnclient \
    make \
    gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN /opt/venv/bin/pip install faker urllib3 psycopg2-binary psutil pyyaml
RUN pgxn install postgresql_faker
