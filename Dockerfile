FROM orchardup/nginx

# Install Golang
RUN apt-get update
RUN apt-get install supervisor curl git mercurial gcc -y
RUN curl -O https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.3.1.linux-amd64.tar.gz && ln -s /usr/local/go/bin/go /usr/bin/go
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

