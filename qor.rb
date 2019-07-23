class Qor < Formula
  desc "Cli v2 (using Go)"
  homepage "https://github.com/Qordobacode/Cli-v2"
  url "https://github.com/Qordobacode/Cli-v2/archive/v0.6.3.tar.gz"
  sha256 "921a79981982a51f960aaa8e28419cd2114f7219348da4c91876f117660d661d"
  head "https://github.com/Qordobacode/Cli-v2.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    src = buildpath/"src/github.com/qordobacode/cli-v2"
    src.install buildpath.children
    ldflags = %W[
        -s -w
        -X github.com/CircleCI-Public/circleci-cli/cmd.PackageManager=homebrew
        -X github.com/Qordobacode/Cli-v2/version.Version=0.6.2
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