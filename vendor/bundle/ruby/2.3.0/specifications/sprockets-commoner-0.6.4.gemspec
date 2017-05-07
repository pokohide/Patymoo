# -*- encoding: utf-8 -*-
# stub: sprockets-commoner 0.6.4 ruby lib

Gem::Specification.new do |s|
  s.name = "sprockets-commoner".freeze
  s.version = "0.6.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bouke van der Bijl".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-03-06"
  s.description = "Sprockets::Commoner uses Node.JS to compile ES2015+ files to ES5 using Babel directly from NPM, without vendoring it.".freeze
  s.email = ["bouke@shopify.com".freeze]
  s.homepage = "https://github.com/Shopify/sprockets-commoner".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2".freeze
  s.summary = "Use Babel in Sprockets to compile modules for the browser".freeze

  s.installed_by_version = "2.5.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sprockets>.freeze, ["< 5", ">= 3"])
      s.add_runtime_dependency(%q<schmooze>.freeze, ["~> 0.1.6"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_development_dependency(%q<coffee-script>.freeze, ["~> 2.4"])
      s.add_development_dependency(%q<uglifier>.freeze, ["~> 2.7"])
      s.add_development_dependency(%q<pry>.freeze, ["~> 0.10"])
    else
      s.add_dependency(%q<sprockets>.freeze, ["< 5", ">= 3"])
      s.add_dependency(%q<schmooze>.freeze, ["~> 0.1.6"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_dependency(%q<coffee-script>.freeze, ["~> 2.4"])
      s.add_dependency(%q<uglifier>.freeze, ["~> 2.7"])
      s.add_dependency(%q<pry>.freeze, ["~> 0.10"])
    end
  else
    s.add_dependency(%q<sprockets>.freeze, ["< 5", ">= 3"])
    s.add_dependency(%q<schmooze>.freeze, ["~> 0.1.6"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<coffee-script>.freeze, ["~> 2.4"])
    s.add_dependency(%q<uglifier>.freeze, ["~> 2.7"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.10"])
  end
end
