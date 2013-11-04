Bundler.require
require_relative 'product'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: '/tmp/sample.db'

Product.all.each do |product|
  p product
end
