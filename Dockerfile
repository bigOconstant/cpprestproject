FROM ubuntu as build
RUN apt-get update && apt-get install -y build-essential git cmake autoconf libtool pkg-config libcpprest-dev libcpprest
WORKDIR /src
COPY CMakeLists.txt main.cpp ./
RUN cmake . && make

FROM ubuntu as app
RUN apt-get update && apt-get install -y libcpprest
WORKDIR /app
COPY --from=build /src/main ./
STOPSIGNAL SIGTERM
ENTRYPOINT ["/app/main"]