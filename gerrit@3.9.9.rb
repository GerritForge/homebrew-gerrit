# typed: false
# frozen_string_literal: true

require_relative 'gerritbase'

class GerritAT399 < GerritBase

  def self.java_version
    "17"
  end

  set_common_dependencies

  version "3.9.9"
  sha256 "373f242b1105af584719d0573ea1d89efa4f77bd606407a5ce2d17501a1da058"
  url generate_url(version)

end
