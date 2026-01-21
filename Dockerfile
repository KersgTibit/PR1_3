FROM debian:13.2

RUN apt-get update && \
    apt-get install -y build-essential && \
    rm -rf /var/lib/apt/lists/*

COPY bubblesort.deb /tmp/bubblesort.deb

RUN dpkg -i /tmp/bubblesort.deb || apt-get install -f -y

WORKDIR /usr/local/bin

CMD ["sh", "-c", "echo \"5\n5 3 1 4 2\" | bubblesort"]
