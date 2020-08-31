FROM node:lts-alpine
ARG VERSION="8.9.2"
LABEL org.label-schema.schema-version="1.0" \
      org.label-schema.name="firebase-tools" \
      org.label-schema.version=${VERSION} \
      org.label-schema.description="Firebase CLI on the NodeJS image" \
      org.label-schema.url="https://github.com/firebase/firebase-tools/" \
      org.label-schema.vcs-url="https://github.com/AndreySenov/firebase-tools-docker/"
ENV FIREBASE_TOOLS_VERSION=${VERSION}
ENV HOME=/root
RUN apk --no-cache add bash && \
    yarn global add firebase-tools@${VERSION} && \
    yarn cache clean && \
    firebase -V
USER root
VOLUME $HOME/.cache
WORKDIR $HOME
CMD ["sh"]
