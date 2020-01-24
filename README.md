# cpp rest api code

Using c++ to host a rest api. Uses ubuntu docker container. 

## Compile


```bash
docker build -t cpprest .
docker run --rm -p 8080:8080 cpprest
```

see output of request in the browser by going to `localhost:8080`


## Dependencies
* docker
