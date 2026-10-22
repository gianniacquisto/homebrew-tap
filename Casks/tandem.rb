cask "tandem" do
  version "0.19.0"
  sha256 "05f7e379035015455c37199bbbfec8bf981b07b304442c5d94ce6ebe1cde290f"

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
