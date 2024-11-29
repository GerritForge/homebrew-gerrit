# typed: false
# frozen_string_literal: true

require_relative 'gerritbase'

class GerritAT3104 < GerritBase

  def self.java_version
    "17"
  end

  set_common_dependencies

  version "3.10.4"
  sha256 "25bf15decd6533424d9d3f9c01bf6fba2798f7b752866ed3547653ed52f4a930"
  url generate_url(version)

end
