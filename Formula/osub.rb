class Osub < Formula
  desc "OpenSubtitles in your terminal. Download subtitles like a ninja"
  homepage "https://github.com/vanyauhalin/osub"
  url "https://github.com/vanyauhalin/osub/releases/download/v0.3.0/osub.tar.zst"
  sha256 "c8b94cc25ba2efa7ddecd9d2a4014d68364d1f625d8bd6a6755cf82b902453ed"
  license "MIT"
  head "https://github.com/vanyauhalin/osub.git", branch: "main"

  depends_on "zstd" => [:build, :test]
  depends_on "xz" => :test
  depends_on macos: :catalina

  resource("hash-fixture") do
    url "https://github.com/vanyauhalin/osub/raw/v0.3.0/osub/Hash/Fixtures/file"
    sha256 "8656682279c9b3e0b3f23670cae459bba0461fb662458f44ca035b6c14fcd4c0"
  end

  def install
    bin.install "osub"
  end

  test do
    assert_match shell_output("#{bin}/osub version").strip, "0.3.0"
    resource("hash-fixture").stage do
      assert_match shell_output("#{bin}/osub hash file").strip, "c97e8b1573a25396"
    end
  end
end
