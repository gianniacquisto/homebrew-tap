cask "tandem" do
  version "0.7.0"
  sha256 "d6445250f6eeea09baaf5f8ff8a13bef09b8f3eff07c728afb4a858dacf15838"

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
