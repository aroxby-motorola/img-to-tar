FROM ubuntu:jammy

# NB: We could feed this directly into the ubuntu image with a shell script
# Or install partx on alpine

CMD sh -exc '\
    OFFSET=$((512 * $(partx --bytes -g -n2 -o start /input.img))) && \
    mount -o ro,offset=$OFFSET /input.img /mnt && \
    cd /mnt && \
    tar -zcf /output.tgz * \
'

# touch new-tar.tgz && \
# docker run --rm -it --privileged -v ./my-image.img:/input.img -v ./new-tar.tgz:/output.tgz img-to-tar


# touch new-tar.tgz && \
# docker run --rm -it --privileged \
#  --mount src=./my-image.img,dst=/input.img,type=bind,readonly \
#  --mount src=./new-tar.tgz,dst=/output.tgz,type=bind \
#  img-to-tar
