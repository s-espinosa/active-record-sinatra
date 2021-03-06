ENV["RACK_ENV"] ||= "test"

require 'bundler'
Bundler.require

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'capybara'
require 'pry'

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation, {except: %w[public.schema.migrations]}

Capybara.app = FilmFile
