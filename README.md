# QUIT Docker
Docker container for running [Quantitaive Imaging Tools (QUIT)](https://github.com/spinicist/QUIT).

Build container with
```
docker build -t qi .
```

Run container with
```
docker run qi <your command>
```

You will also have to mount any relevant files you want to use. Working directory when starting the container is `/root/app`.
