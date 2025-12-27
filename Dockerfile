From nginx:latest   #base image
RUN rm -rf /user/share/nginx/html/*
COPY index.html /user/share/nginx/html/
EXPOSE 80
