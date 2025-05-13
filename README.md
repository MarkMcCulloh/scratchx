# ScratchX - A scratch image + tiny executable

This is (hopefully) the smallest possible docker image that can be successfully executed.
It is based on the [scratch](https://hub.docker.com/_/scratch) base image with the addition of the following compiled assembly:

```asm
SECTION .text align=1
GLOBAL _start
_start:
    mov       al, 60
    syscall
```

The actual image size is 124 bytes and the tgz file is ~1.3KB.

*Note that is is currently only for `linux/amd64` platform as the it is assembled as a `elf64` binary.*

### Usage

Running the image will immediately exit with 0.

```shell
docker pull markmcculloh/scratchx
docker run markmcculloh/scratchx
```

The image is also commited as a tarball in this repository.

### Why

Other than for fun, this image can be used as a base for images that need to only contain files rather than anything executable.
