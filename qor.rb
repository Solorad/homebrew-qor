class Qor < Formula
  desc "Cli v2 (using Go)"
  homepage "https://github.com/Qordobacode/Cli-v2"
  url "https://github.com/Qordobacode/Cli-v2/archive/version-0.6.0.tar.gz"
  sha256 "4896e34f48bae3bfe90a87eb3fdfe008ccb86145df3b09b6c75375579c6c52e6"
  head "https://github.com/Qordobacode/Cli-v2.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    src = buildpath/"src/github.com/qordobacode/cli-v2"
    src.install buildpath.children
    ldflags = %W[
        -s -w
        -X github.com/CircleCI-Public/circleci-cli/cmd.PackageManager=homebrew
        -X github.com/Qordobacode/Cli-v2/version.Version=0.6.0
    ]
    src.cd do
      system "go", "build", "-ldflags", ldflags.join(" "), "-o", "#{bin}/qor"
      prefix.install_metafiles
    end
  end

  test do
    assert_match "Qordoba Cli v4.0", shell_output("#{bin}/qor --version")
  end
end