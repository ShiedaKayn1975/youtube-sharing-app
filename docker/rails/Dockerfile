FROM ruby:3.0.0

ARG BUNDLER_VERSION=2.3.6
ENV RAILS_ROOT /app

ENV BUNDLER_PATH=/bundle BUNDLE_BIN=/bundle/bin GEM_HOME=/bundle BUNDLER_VERSION=${BUNDLER_VERSION}
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./
COPY . ./

RUN apt-get update && \
    apt-get install build-essential -y --no-install-recommends \
    vim \
    git \
    gnupg2 \
    curl \
    wget \
    patch \
    ruby-dev \
    zlib1g-dev \
    liblzma-dev 

RUN gem install bundler -v ${BUNDLER_VERSION}

RUN bundle check || bundle install 

EXPOSE 3000

ENTRYPOINT ["sh", "docker/entrypoint.sh"]
