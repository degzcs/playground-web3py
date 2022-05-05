# SmartContracts with Python

Web3 py + Solidity + Ganache

## Install

```bash
$ docker-compose build
$ docker-compose up

```

open another terminal and execute

```bash
$ cd code/python_simple_storage
$ cp .env.example .env
$ docker-compose exec web3-dev bash -c 'cd py_simple_storage && python deploy.py'
# docker-compose run web3-dev bash -c 'cd py_simple_storage && python deploy.py'
```
