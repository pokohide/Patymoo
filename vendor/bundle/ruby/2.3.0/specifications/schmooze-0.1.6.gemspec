# -*- encoding: utf-8 -*-
# stub: schmooze 0.1.6 ruby lib

Gem::Specification.new do |s|
  s.name = "schmooze".freeze
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bouke van der Bijl".freeze]
  s.date = "2016-05-12"
  s.description = "Schmooze allows a Ruby library writer to succintly interoperate between Ruby and JavaScript code. It has a clever DSL to make this possible.".freeze
  s.email = ["bouke@shopify.com".freeze]
  s.homepage = "https://github.com/Shopify/schmooze".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Schmooze lets Ruby and Node.js work together intimately.".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
    else
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    end
  else
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
  end
end
