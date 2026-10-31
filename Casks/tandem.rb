cask "tandem" do
  version "0.41.0"
  sha256 "2a75c61a309868107c7ed9af051144720dcc48bb270e9bd9eab6cc58551838e1"

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
