FROM nginx:1.19.3-alpine
VOLUME [ "/usr/share/nginx/html" ]
RUN apk add --no-cache bash
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
