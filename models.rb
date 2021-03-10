require 'bundler/setup'
Bundler.require

if development?
  ActiveRecord::Base.establish_connection('sqlite3:db/development.db')
end

class User < ActiveRecord::Base
  has_secure_password
  validates :mail,
    presence: true,
    format: {with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :password,
    presence: true,
    length: {in: 5..20}
end