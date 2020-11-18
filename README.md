## Perl 5 in a box

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/sollinge/jupyperl/HEAD)

### Run with Binder

Simply open https://mybinder.org/v2/gh/sollinge/jupyperl/HEAD

### Run locally with Docker

```
$ git clone https://github.com/sollinge/jupyperl
$ cd jupyperl
$ docker build -t jupyperl .
$ docker run -v $(PWD):/home/jovyan -p 8888:8888 -it jupyperl
```

