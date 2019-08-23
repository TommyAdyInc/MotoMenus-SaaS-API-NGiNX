FROM nginx:1.16.1-alpine

WORKDIR /usr/share/nginx/html

# Overwrite the default nginx.conf with a custom NGiNX configuration file.
COPY ./etc/nginx/nginx.conf /etc/nginx/nginx.conf

# Copy common configuration directives (included in one or more virtual servers) into the container.
COPY ./etc/nginx/common.conf /etc/nginx/common.conf

# Copy all the files in the `conf.d` directory into the container.
COPY ./etc/nginx/conf.d/ /etc/nginx/conf.d/

# Ensure `web-user` user exists.
RUN addgroup -g 10000 -S web-user \
	&& adduser -u 10000 -D -S -G web-user web-user
