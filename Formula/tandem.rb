class Tandem < Formula
  desc "Todo app for humans and agents on the same Mac"
  homepage "https://github.com/gianniacquisto/tandem"
  url "https://github.com/gianniacquisto/tandem/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "afa362be071d535689eb5c3818ebddb94be7fa518add3dbe193c7877c0d037c5"
  license "MIT"

  # Requires the Xcode Command Line Tools (`xcode-select --install`).
  depends_on macos: :tahoe

  def install
    # SwiftPM fetches the MCP Swift SDK from GitHub during the build.
    # --disable-sandbox: SwiftPM nests sandbox-exec for manifest compilation,
    # which cannot run inside the Homebrew build sandbox.
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "tandem-mcp"
    system "swift", "build", "--disable-sandbox", "-c", "release", "--product", "Tandem"
    bin.install ".build/release/tandem-mcp"
    bin.install ".build/release/Tandem" => "tandem"
  end

  test do
    # MCP over stdio: one initialize round-trip proves the server runs.
    # The response is read before stdin is closed (the server exits on
    # EOF), so startup timing cannot race the handshake.
    require "open3"
    init = "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"initialize\"," \
           "\"params\":{\"protocolVersion\":\"2025-06-18\",\"capabilities\":{}," \
           "\"clientInfo\":{\"name\":\"homebrew\",\"version\":\"0.0.0\"}}}"
    out = +""
    Open3.popen2(bin/"tandem-mcp") do |stdin, stdout|
      stdin.write(init + "\n")
      # Wait up to 10s for the response line, then close stdin (the server
      # exits on EOF) and drain any remaining output.
      10.times do
        next if stdout.wait_readable(1).none?

        line = stdout.gets
        break if line.nil?

        out << line
        break if line.include?("serverInfo")
      end
      stdin.close
      out << stdout.read.to_s
    end
    assert_match(/"serverInfo"/, out, "MCP initialize handshake failed")
  end
end
