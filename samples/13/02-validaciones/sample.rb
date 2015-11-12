require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: '/tmp/sample.db'

class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :terminos, acceptance: true
#  validates :boolean_field_name, inclusion: { in: [true, false] }
#  validates :boolean_field_name, exclusion: { in: [nil] }
#  validates :name, format: { 
#            with: /\A[a-zA-Z]+\z/,
#            message: "only allows letters" }
#
end

