# Use an official lightweight nginx image
FROM nginx:alpine

# Remove the default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy your website files into the nginx public folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80
