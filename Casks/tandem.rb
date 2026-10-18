cask "tandem" do
  version "0.11.0"
  sha256 "9ee87ae6625f05c6a0078580b01196c36d5575f71c96241ea2ecc63ae5c446c5"

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
