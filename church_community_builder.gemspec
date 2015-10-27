$:.push File.expand_path("../lib", __FILE__)
require "base64"

Gem::Specification.new do |s|
  s.name              = "church_community_builder"
  s.version           = "0.0.6"
  s.authors           = ['Taylor Brooks']
  s.email             = ["dGJyb29rc0BnbWFpbC5jb20="].map{ |e| Base64.decode64(e) }
  s.homepage          = "https://github.com/taylorbrooks/church_community_builder"

  s.summary = 'Ruby gem/plugin to interact with the Church Community Builder API (https://support.churchcommunitybuilder.com/customer/portal/articles/640589-api-documentation).'
  s.description = 'Ruby gem/plugin to interact with the Church Community Builder API (https://support.churchcommunitybuilder.com/customer/portal/articles/640589-api-documentation). Checkout the project on github for more detail.'
  s.license = 'MIT'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"

  s.add_runtime_dependency "faraday"
  s.add_runtime_dependency "faraday_middleware"
  s.add_runtime_dependency "multi_xml"

  s.files         = `git ls-files`.split("\n").delete_if { |f| !(f =~ /^examples/).nil? }
  s.test_files    = `git ls-files -- {test,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
