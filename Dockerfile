FROM ruby:latest

ENV APP_ROOT /usr/src/andromeda_api
WORKDIR $APP_ROOT

RUN apt-get update -qq && \
    apt-get install -y nodejs \
                     mysql-client \
                     --no-install-recommends

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN echo 'gem: --no-document' >> ~/.gemrc && \
    cp ~/.gemrc /etc/gemrc && \
    chmod uog+r /etc/gemrc && \
    bundle config --global build.nokogiri --use-system-libraries && \
    bundle config --global jobs 4 && \
    bundle install && \
    rm -rf ~/.gem

COPY . $APP_ROOT
