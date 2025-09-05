cat > Dockerfile <<EOF
# Use a lightweight web server image
FROM nginx:alpine

# Copy index.html to nginx default html folder
COPY index.html /usr/share/nginx/html/index.html

# Expose port 8080
EXPOSE 8080

# Change NGINX default port 80 to 8080
RUN sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
EOF

