# frozen_string_literal: true

$:.push File.expand_path('../lib', __FILE__)
require 'base64'

Gem::Specification.new do |s|
  s.name       = 'church_community_builder'
  s.version    = '0.1.0'
  s.authors    = ['Taylor Brooks']
  s.email      = ['dGJyb29rc0BnbWFpbC5jb20='].map { |e| Base64.decode64(e) }
  s.homepage   = 'https://github.com/taylorbrooks/church_community_builder'

  SUMMARY = 'Ruby gem/plugin to interact with the Church Community Builder API (https://support.churchcommunitybuilder.com/customer/portal/articles/640589-api-documentation).'

  s.summary = SUMMARY
  s.description = SUMMARY
  s.license = 'MIT'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'

  s.add_runtime_dependency 'addressable'
  s.add_runtime_dependency 'faraday', '> 2.0'
  s.add_runtime_dependency 'faraday-decode_xml'

  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test)/})
  s.executables   = s.files.grep(%r{^bin/}).map { |f| File.basename(f) }

  s.require_paths = ['lib']
end
