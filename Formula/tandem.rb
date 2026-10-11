class Tandem < Formula
  desc "Todo app for humans and agents on the same Mac"
  homepage "https://github.com/gianniacquisto/tandem"
  url "https://github.com/gianniacquisto/tandem/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "8f7323eb9f1ea5df566415ce17e5c652a8178f8e675b29e33e5c7b67f0644f62"
  license "MIT"

  # Requires the Xcode Command Line Tools (`xcode-select --install`).
  depends_on macos: :tahoe

  def install
    # SwiftPM fetches the MCP Swift SDK from GitHub during the build.
    # --disable-sandbox: SwiftPM nests sandbox-exec for manifest compilation,
    # which cannot run inside the Homebrew build sandbox.
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "tandem-mcp"
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "Tandem"
    # Assemble the GUI app bundle (ADR 0002 in the source repo) before the
    # bin.install below: Homebrew's install moves files into the Cellar, so
    # the built binary must still be in the build tree when this copies it.
    # The cask links the bundle into /Applications so Launchpad and Spotlight
    # can find it.
    system "./Scripts/make-app-bundle.sh", ".build/release/Tandem", version.to_s, "app-out"
    bin.install ".build/release/tandem-mcp"
    bin.install ".build/release/Tandem" => "tandem"
    share.install "app-out/Tandem.app"
  end

  test do
    # The MCP server must launch and exit cleanly when stdin reaches EOF.
    # All stdio goes to /dev/null (no pipes): a full `initialize`
    # round-trip needs a live client holding stdin open, which the
    # forked `brew test` child does not do reliably.
    require "open3"
    result = Open3.capture3(bin/"tandem-mcp",
                            in: File::NULL, out: File::NULL, err: File::NULL)
    assert_predicate result.last, :success?, "tandem-mcp failed to launch"

    # The app bundle must be intact (the cask links it into /Applications).
    assert_predicate share/"Tandem.app/Contents/MacOS/Tandem", :executable?
    system "codesign", "--verify", "--strict", share/"Tandem.app"
  end
end
