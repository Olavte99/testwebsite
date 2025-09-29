# Simple Nginx static site image
FROM nginx:1.27-alpine


# Inject build-time arg for display
ARG IMAGE_TAG
ENV IMAGE_TAG=${IMAGE_TAG}


# Copy site
COPY app /usr/share/nginx/html


# Optional: tiny substitution of ${IMAGE_TAG} in index.html at build time
RUN sed -i "s/\${IMAGE_TAG}/${IMAGE_TAG:-unknown}/g" /usr/share/nginx/html/index.html


# Expose default port
EXPOSE 80