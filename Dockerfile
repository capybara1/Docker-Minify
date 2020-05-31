FROM alpine:3.11
ARG VERSION
ARG VCS_REF
ARG BUILD_DATE
ENV MINIFY_VERSION 2.7.4
ENV MINIFY_URL https://github.com/tdewolff/minify/releases/download/v${MINIFY_VERSION}/minify_${MINIFY_VERSION}_linux_amd64.tar.gz
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.version="$VERSION" \
      org.label-schema.maintainer="https://github.com/capybara1/" \
      org.label-schema.url="https://github.com/capybara1/Docker-Minify" \
      org.label-schema.name="tig" \
      org.label-schema.license="MIT" \
      org.label-schema.vcs-url="https://github.com/capybara1/Docker-Minify" \
      org.label-schema.vcs-ref="$VCS_REF" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.dockerfile="/Dockerfile"
RUN wget -O /tmp/minify.tar.gz ${MINIFY_URL} \
 && tar -xzf /tmp/minify.tar.gz -C /tmp \
 && mv /tmp/minify /usr/bin \
 && rm -rf /tmp/*
WORKDIR /project
ENTRYPOINT ["/usr/bin/minify"]
