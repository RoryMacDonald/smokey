require 'webrat'
require 'WAAT'

Webrat.configure do |config|
  config.mode = :mechanize
end

World(Webrat::Methods)
World(Webrat::Matchers)
