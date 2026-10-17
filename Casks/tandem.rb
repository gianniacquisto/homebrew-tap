cask "tandem" do
  version "0.6.0"
  sha256 "43935bc5940237615ddbb1c60c2479a32587baaebd18f7c40842a60f32bfca31"

  url "https://github.com/gianniacquisto/tandem/releases/download/v#{version}/Tandem-#{version}.zip"
  name "Tandem"
  desc "Todo app shared by humans and agents"
  homepage "https://github.com/gianniacquisto/tandem"

  livecheck do
    url "https://github.com/gianniacquisto/tandem/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Tandem.app"
end
