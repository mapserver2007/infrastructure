FROM ruby:2.5

ENV USER mapserver2007
ENV REPO elastic-lifelog

WORKDIR /workspace
ADD https://api.github.com/repos/$USER/$REPO/git/refs/heads/master version.json
RUN git clone https://github.com/$USER/$REPO.git

RUN bundle install --gemfile /workspace/$REPO/fitbit/Gemfile && \
  bundle install --gemfile /workspace/$REPO/lastfm/Gemfile && \
  bundle install --gemfile /workspace/$REPO/runkeeper/Gemfile && \
  bundle install --gemfile /workspace/$REPO/withings/Gemfile

COPY secrets/fitbit/token.yml /workspace/$REPO/fitbit/config
COPY secrets/lastfm/token.yml /workspace/$REPO/lastfm/config
COPY secrets/runkeeper/token.yml /workspace/$REPO/runkeeper/config
COPY secrets/withings/token.yml /workspace/$REPO/withings/config
