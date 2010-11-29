Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = "mobileesp"
  s.version = "1.120"
  s.date = Time.now
  s.summary = "Ruby port and tweak of Mobile ESP: http://www.mobileesp.com/"
  s.require_paths = ["lib"]
  s.author = "Martin Westin"
  s.email = "martin@greatconnection.se"
  s.homepage = "http://www.mobileesp.com/"
  s.add_development_dependency('rspec')
  s.description = "Ruby port and tweak of Mobile ESP: http://www.mobileesp.com/ It is the same simple mobile browser detection library, only in Ruby."
  s.files = Dir["{lib}/**/*", "[A-Z]*", "init.rb"]
  s.required_ruby_version = ">= 1.9.2"
  s.required_rubygems_version = ">= 1.3.7"
end