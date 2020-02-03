FROM ubuntu as build
RUN apt-get update && apt-get install -y build-essential git cmake autoconf libtool pkg-config libcpprest-dev libcpprest
WORKDIR /src
ADD . /src
RUN cmake . && make

FROM ubuntu as app
RUN apt-get update && apt-get install -y libcpprest
RUN apt-get install -y sqlite3;
RUN apt-get install -y libsqlite3*;

WORKDIR /app
COPY --from=build /src/main ./
STOPSIGNAL SIGTERM
ENTRYPOINT ["/app/main"]
