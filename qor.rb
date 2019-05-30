class Qor < Formula
  desc "Cli v2 (using Go)"
  homepage "https://github.com/Qordobacode/Cli-v2"
  url "https://github.com/Qordobacode/Cli-v2/archive/version-0.4.1.tar.gz"
  sha256 "e8ea9d042014211e2cb9b31a493eacaa54a15bc237bd47d3781843e55a6d7577"
  head "https://github.com/Qordobacode/Cli-v2.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    src = buildpath/"src/github.com/qordobacode/cli-v2"
    src.install buildpath.children
    ldflags = %W[
        -s -w
        -X github.com/CircleCI-Public/circleci-cli/cmd.PackageManager=homebrew
        -X github.com/Qordobacode/Cli-v2/version.Version=0.4.1.
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