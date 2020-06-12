ENV['SINATRA_ENV'] ||= "development"



require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  set :database, {adapter: "sqlite3", database: "db/app_data"}
end

configure :production do
  set :database, {adapter: "postgresql", encoding: 'unicode', database: "db/app_data", pool: 2, username: "jprdisohcwaqzv", password: ENV["DB_PASS"]}
end


require './app/controllers/application_controller'
require_all 'app'
