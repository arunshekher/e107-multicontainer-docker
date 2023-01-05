# e107 Multi-container Docker Setup

## Usage

### 1. Short
```shell
git clone https://github.com/arunshekher/e107-multicontainer-docker.git e107_docker;
cd e107_docker;
sh ./script/setup.sh
```


### 2. Not so short
```shell
git clone https://github.com/arunshekher/e107-multicontainer-docker.git e107_docker;
```
rename `.env.example` file from `.env` file inside `e107_docker` directory.

```shell
cd e107_docker;
docker-compose pull;
docker-compose up -d
```