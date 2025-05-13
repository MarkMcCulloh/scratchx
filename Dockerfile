FROM --platform=amd64 alpine:3.21 AS builder
RUN apk update && apk upgrade && apk add build-base nasm
COPY tiny.asm /tiny.asm
RUN nasm -f elf64 /tiny.asm
RUN ld -s -no-pie -z noseparate-code /tiny.o -o /tiny
RUN strip --strip-section-headers /tiny

FROM scratch
COPY --chown=0:0 --from=builder /tiny /x
ENTRYPOINT ["/x"]
