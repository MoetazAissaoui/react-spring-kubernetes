# Use a newer Debian-based Node.js image (Buster or Bullseye)
FROM node:12-buster as build

# Set working directory
WORKDIR /app/

# Install app dependencies and build the React app
COPY ./ /app/
RUN yarn install
RUN yarn build

# Production stage
FROM nginx:alpine

# Copy nginx configuration
COPY nginx.conf /etc/nginx/sites-available/default

# Ensure nginx runs in the foreground
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# Copy the built React app from the build stage to the Nginx web root
COPY --from=build /app/build /usr/share/nginx/html

# Expose port for the web server
EXPOSE 80

# Start nginx
CMD ["nginx"]
