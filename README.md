# INDEX
- [ABOUT](#ABOUT)
- [ENVIRONMENT](#ABOUT)
- [PREPARING](#PREPARING)
- [HOW TO USE](#HOW-TO-USE)
- [REFERENCE](#REFERENCE)

# ABOUT
build apache and ssh server in Local Network to shared file or something.

# ENVIRONMENT
- docker
- bash(Ubuntu 20.04)

# PREPARING
1. install docker.
2. give privilege `docker` not root.

# HOW TO USE
1. put file you wanted to share in this directory.
2. edit [setup.sh](./setup.sh)

```shell
file_="your file name"
```
3. execute [setup.sh](./setup.sh)

```shell
./setup.sh
```

4. access webserver to check apache is runninng.[http://localhost:81](check)
5. access yourfile. http://localhost:81/your file name


