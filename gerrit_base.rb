# typed: false
# frozen_string_literal: true

class GerritBase < Formula

  def self.generate_url(version)
    "https://tarball.gerritforge.com/gerrit-" + version + ".tar.gz"
  end

  java_version = "21"
  desc ""
  version "3.11.0-rc5"
  homepage "https://www.gerritcodereview.com"
  url generate_url(version)
  sha256 "97bdaf49d49cd355a9e671b5e5935823ed94950f136081d16c83579418c266d7"

  depends_on "openjdk@#{@java_version}"
  depends_on "git"
  depends_on "openssh"



  def install
    mkdir_p prefix/"plugins"
    (prefix/"plugins").install "plugins/uploadvalidator.jar"
    (prefix/"plugins").install "plugins/avatars-gravatar.jar"

    bin.install "bin/gerrit.war"
    lib.install "lib/out-of-the-box.jar"

    mkdir_p var/"gerrit"
    mkdir_p var/"gerrit"/"etc"
    (var/"gerrit"/"etc").install "etc/gerrit.config"

    (var/"gerrit/plugins").install_symlink Dir[prefix/"plugins/*"]
    (var/"gerrit/lib").install_symlink Dir[lib/"*"]

    system "java", "-jar", bin/"gerrit.war", "init", "-d", (var/"gerrit"), "--batch", "--install-all-plugins", "--no-auto-start"
    ohai ""
    ohai "Gerrit site initialized in " + (var/"gerrit")
    ohai "---------------------------------------------------------"
    ohai " * To start Gerrit: " + (var/"gerrit/bin/gerrit.sh start")
    ohai " * Gerrit will then be available at http://localhost:8080"
    ohai ""
    ohai " * To stop  Gerrit: " + (var/"gerrit/bin/gerrit.sh stop")
    ohai ""
  end
end
