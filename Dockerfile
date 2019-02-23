FROM atmoz/sftp

RUN apt-get update && apt-get install -y unzip fuse man-db curl \
    && curl https://rclone.org/install.sh | bash
