#!/bin/bash
# set up
file_=junitbook_cheatsheet.pdf
file_edit_name=$(echo $file_ | sed 's/\_/\\_/')
sed -i "s/tmp/$file_edit_name/g" ./Dockerfile

# building from docker file"
docker image build -t fileserver . # docker imageを作成する -tでイメージタグを指定
docker image ls # イメージが作成されていることを確認。

# creating container"
docker container create --name hoge -it -p 20021:20022 -p 81:80 fileserver # イメージからコンテナを作成
docker container ls

# starting container and execute shell
echo "-----STARTING SERVER-----"
docker container start hoge
docker container ls
curl localhost:81/index.html
ssh root@localhost -p 20021 # localhostの20021に接続するとコンテナの20022に転送される。

# stop
echo "-----STOPPING CONTAINER-----"
docker container stop hoge -t 1 # 強制的に停止するまでの時間を1秒に

# removing container, image
docker container rm hoge
docker container ls -a # 起動していないコンテナを含めて全表示
docker image rm fileserver
docker image ls

# tear down
sed -i "s/$file_edit_name/tmp/g" ./Dockerfile
