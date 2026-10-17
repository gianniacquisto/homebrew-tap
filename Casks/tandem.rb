cask "tandem" do
  version "0.8.0"
  sha256 "317e6854a1e48d40707020543dbf07a05b5dd74789512cf743c31cf4e891500e"

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
