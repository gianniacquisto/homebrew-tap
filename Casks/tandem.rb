cask "tandem" do
  version "0.5.0"
  sha256 "00894c701ae7809d0ee89f30b19cba41d9966e0cf9d7761a1f8f184d63ee3db2"

  url "https://github.com/gianniacquisto/tandem/releases/download/v#{version}/Tandem-#{version}.zip"
  name "Tandem"
  desc "Todo app shared by humans and agents"
  homepage "https://github.com/gianniacquisto/tandem"

  livecheck do
    url "https://github.com/gianniacquisto/tandem/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :golden_gate

  app "Tandem"
end
