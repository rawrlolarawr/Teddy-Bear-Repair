ENV['SINATRA_ENV'] ||= "development"



require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  set :database, {adapter: "postgresql", encoding: 'unicode', database: "db/app_data", pool: 2}
end

require './app/controllers/application_controller'
require_all 'app'
