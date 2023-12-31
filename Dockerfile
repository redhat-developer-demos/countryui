# Base image
FROM ruby:latest

ENV HOME /home/rails/webapp

# Install PGsql dependencies and js engine
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR $HOME

# Install gems
ADD Gemfile* $HOME/
RUN bundle install


# Add the app code
ADD . $HOME

EXPOSE 3000

# Default command
CMD rails s -b 0.0.0.0
#CMD ["rails", "server", "--binding", "0.0.0.0”]