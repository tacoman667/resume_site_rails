FROM rails

WORKDIR /app

RUN gem install bundler --no-ri --no-rdoc

COPY Gemfile /app
RUN bundle install

COPY . /app

EXPOSE 3000

ENV RAILS_ENV=production

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]