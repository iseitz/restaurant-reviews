#! /usr/bin/env zsh

bundle
chmod -R 755 .
bundle exec rails db:drop db:create db:migrate
bundle exec rails db:environment:set RAILS_ENV=development

rails runner grade.rb