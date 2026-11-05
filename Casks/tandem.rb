cask "tandem" do
  version "1.11.0"
  sha256 "3fc6c26b5df1f5c08e8b5a467d0bdafb6055176f6c9aa80e983f96622f8ae8e2"

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
