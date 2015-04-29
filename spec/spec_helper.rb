$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'rspec'

require 'slack'

Dir[File.join(File.dirname(__FILE__), 'support/*.rb')].each do |file|
  require file
end
