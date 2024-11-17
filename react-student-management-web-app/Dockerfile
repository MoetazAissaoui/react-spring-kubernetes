# Use a newer base image with Node.js 16
FROM node:16

# Set working directory
WORKDIR /app/

# Add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Install nginx
RUN apt-get update && apt-get install -y nginx

# Configure nginx
COPY nginx.conf /etc/nginx/sites-available/default
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Install app dependencies
COPY ./ /app/
RUN yarn install
RUN yarn build

# Copy the build files to the nginx public directory
RUN cp -R build/* /var/www/html/

# Forward request and error logs to Docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

# Start nginx
CMD ["nginx"]
