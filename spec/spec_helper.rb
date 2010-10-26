require 'rubygems'
require 'logger'
require 'fileutils'

mobileesp_path = File.expand_path('../lib', File.dirname(__FILE__))
$:.unshift(mobileesp_path) if File.directory?(mobileesp_path) && !$:.include?(mobileesp_path)

require 'mobileesp'

RSpec.configure do |config|
  # config.mock_with :rspec
  config.color_enabled = true
  config.formatter = 'd'
end

# testing UA Strings from:
# http://www.zytrax.com/tech/web/mobile_ids.html