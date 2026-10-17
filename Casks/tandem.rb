cask "tandem" do
  version "0.9.0"
  sha256 "a279aafeb9db0e1b20ed1667867b035044ad9f0515fb7948c204701beb1110f6"

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
