cask "tandem" do
  version "0.10.0"
  sha256 "5d7aa09ad6da224d8092c6359697e67672b2c1c8250a0628b98349253124f406"

  url "https://github.com/gianniacquisto/tandem/releases/download/v#{version}/Tandem-#{version}.zip"
  name "Tandem"
  desc "Todo app shared by humans and agents"
  homepage "https://github.com/gianniacquisto/tandem"

  livecheck do
    url "https://github.com/gianniacquisto/tandem/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :golden_gate

  app "Tandem.app"
end
