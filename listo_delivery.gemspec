# frozen_string_literal: true

require_relative "lib/listo_delivery/version"

Gem::Specification.new do |spec|
  spec.name = "listo-delivery"
  spec.version = ListoDelivery::VERSION
  spec.summary = "Official Ruby client for the Listo Delivery API"
  spec.description = "Quote and book deliveries, manage stores and money, and verify webhooks with the Listo Delivery API. Standard library only."
  spec.authors = ["Listo"]
  spec.homepage = "https://docs.listo.delivery"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"
  spec.metadata = {
    "homepage_uri" => "https://docs.listo.delivery",
    "documentation_uri" => "https://docs.listo.delivery/en/quickstart",
    "changelog_uri" => "https://docs.listo.delivery/en/changelog",
    "source_code_uri" => "https://github.com/listo-delivery/listo-ruby",
    "bug_tracker_uri" => "https://github.com/listo-delivery/listo-ruby/issues",
    "rubygems_mfa_required" => "true"
  }

  # Listed from the directory, never from git, so the gem builds the same
  # from a tarball or a worktree.
  spec.files = Dir.chdir(__dir__) { Dir["lib/**/*.rb"] + ["README.md", "LICENSE", "listo_delivery.gemspec"] }.sort
  spec.require_paths = ["lib"]
end
