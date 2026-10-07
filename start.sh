#!/bin/bash

IMAGE_NAME="compiler-design"
MARKER=".image_built~"

if [ ! -f "Dockerfile" ]; then
    echo "Error: No Dockerfile found, aborting..."
    exit 1
fi

# flag the image as needing to be built or not
NEEDS_BUILD=false
if ! docker image inspect "$IMAGE_NAME" >/dev/null 2>&1; then
    echo "Image not found."
    NEEDS_BUILD=true
elif [ ! -f "$MARKER" ]; then
    # image exists, but we have no local record of when we built it
    NEEDS_BUILD=true
elif [ "Dockerfile" -nt "$MARKER" ] || [ "start.sh" -nt "$MARKER" ]; then
    echo "Dockerfile or script have been updated."
    NEEDS_BUILD=true
fi

# build the image if flagged
if [ "$NEEDS_BUILD" = true ]; then
    echo "Building $IMAGE_NAME..."
    if docker build --platform linux/amd64 -t "$IMAGE_NAME" .; then
        touch "$MARKER"
    else
        echo "Build failed, Aborting..."
        exit 1
    fi
fi

echo "Starting the container..."
# use bind mount
docker run --rm -it -v "$PWD:/home/student" --platform linux/amd64 "$IMAGE_NAME"
