# typed: false
# frozen_string_literal: true

class Gerrit < Formula
  desc ""
  homepage "https://www.gerritcodereview.com"
  version "3.11.0-rc0"
  url "https://github.com/GerritForge/homebrew-gerrit/releases/download/v3.11.0-rc0/gerrit-3.11.0-rc0.tar.gz"
  sha256 "adcabe126fce791f02021d55698e410ec509275cd39acf4c1cc64d75087f4221"
  version "3.11.0-rc0"
  
  depends_on "openjdk@21"
  depends_on "git"
  depends_on "openssh"

  def install
    etc.install "etc/gerrit.config"
    bin.install "bin/gerrit.war"
    lib.install "lib/out-of-the-box.jar"

    mkdir_p prefix/"plugins"
    (prefix/"plugins").install "plugins/uploadvalidator.jar"
    (prefix/"plugins").install "plugins/avatars-gravatar.jar"
  end
end
