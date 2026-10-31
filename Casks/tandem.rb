cask "tandem" do
  version "1.0.2"
  sha256 "77a1a122ceec2c7066706549aab1e813e83e1fc0bbef77961667009d26fe7c43"

  url "https://github.com/gianniacquisto/tandem/releases/download/v#{version}/Tandem-#{version}.zip"
  name "Tandem"
  desc "Todo app shared by humans and agents"
  homepage "https://github.com/gianniacquisto/tandem"

  livecheck do
    url "https://github.com/gianniacquisto/tandem/releases/latest"
    strategy :github_latest
  end

  depends_on macos: :golden_gate

  # The agent-facing CLI the app bundles. The skills and the agent prompts call
  # it by name, so it has to be on PATH for the workflow to work.
  app "Tandem.app"
  binary "#{appdir}/Tandem.app/Contents/MacOS/tandem-cli"
end
