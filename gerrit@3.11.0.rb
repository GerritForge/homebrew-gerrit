# typed: false
# frozen_string_literal: true

class GerritAT3110 < Formula
  desc ""
  homepage "https://www.gerritcodereview.com"
  version "3.11.0-rc1"
  url "https://tarball.gerritforge.com/gerrit-3.11.0-rc1.tar.gz"
  sha256 "5f8d713439b2ceab8cb085671018de1237beb3e2aaa15a4827b61693703c018d"
  
  depends_on "openjdk@21"
  depends_on "git"
  depends_on "openssh"

  def install
    mkdir_p prefix/"plugins"
    (prefix/"plugins").install "plugins/uploadvalidator.jar"
    (prefix/"plugins").install "plugins/avatars-gravatar.jar"

    bin.install "bin/gerrit.war"
    lib.install "lib/out-of-the-box.jar"

    mkdir_p opt_prefix/"etc"
    (opt_prefix/"etc").install "etc/gerrit.config"

    opt_prefix.install_symlink opt_prefix/"plugins"

    system "java", "-jar", bin/"gerrit.war", "init", "-d", opt_prefix, "--batch", "--install-all-plugins"
  end
end
