# Use a minimal Nginx image based on Alpine
FROM nginx:alpine

# Set the working directory to Nginx's default html directory
WORKDIR /usr/share/nginx/html

# Remove the default Nginx static website files
RUN rm -rf ./*

# Copy only necessary files into the Nginx html directory
COPY . .

# Clean up unnecessary files if any (like .git, node_modules, etc.)
RUN rm -rf /usr/share/nginx/html/.git /usr/share/nginx/html/node_modules

# Expose port 80 to the host
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
