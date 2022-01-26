class HdlDump < Formula
  desc "Install games in HDLoader format to APA-formatted hard drive"
  homepage "https://github.com/ps2homebrew/hdl-dump"
  url "https://github.com/ps2homebrew/hdl-dump/archive/1e760d7.tar.gz"
  version "1e760d7"
  sha256 "5a7658fda7bab96986cbd999bc9fa127710d2c749d48859e12a15eb3fc71d8a4"
  license "GPL-2.0-only"
  head "https://github.com/ps2homebrew/hdl-dump.git", tag: "latest"

  def install
    system "make", "RELEASE=yes", "IIN_OPTICAL_MMAP=no"
    bin.install "hdl_dump" => "hdl-dump"
  end

  test do
    assert_includes "hdl_dump", shell_output("#{bin}/hdl-dump info help", 100)
  end
end
