# typed: false
# frozen_string_literal: true

class GerritAT3110 < GerritBase

  java_version = "21"
  version "3.11.0-rc5"
  sha256 "97bdaf49d49cd355a9e671b5e5935823ed94950f136081d16c83579418c266d7"
  url generate_url(version)
end
