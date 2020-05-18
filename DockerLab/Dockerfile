FROM debian
ADD debian.list /etc/apt/sources.list.d/
RUN apt-get update && apt-get -y upgrade && apt -y install nginx && apt-get clean && \
    cd /var/www/ && rm -rf ./* && \
    mkdir -p dockerlab.com/img && \
    chmod -R 754 /var/www/dockerlab.com/ && \
    useradd sergo2048 && groupadd arefyev && usermod -aG arefyev sergo2048 && \
    chown -R sergo2048:arefyev /var/www/dockerlab.com && \
    sed -i 's|/var/www/html|/var/www/dockerlab.com|g' /etc/nginx/sites-enabled/default && \
    sed -i 's/user www-data/user sergo2048/g' /etc/nginx/nginx.conf
ADD index.html /var/www/dockerlab.com
ADD img/docker.png /var/www/dockerlab.com/img
CMD ["nginx", "-g", "daemon off;"]