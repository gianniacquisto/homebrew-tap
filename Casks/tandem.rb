cask "tandem" do
  version "0.3.0"
  sha256 "8f7323eb9f1ea5df566415ce17e5c652a8178f8e675b29e33e5c7b67f0644f62"

  url "https://github.com/gianniacquisto/tandem/archive/refs/tags/v#{version}.tar.gz"
  name "Tandem"
  desc "Todo app shared by humans and agents"
  homepage "https://github.com/gianniacquisto/tandem"

  # The formula in this same tap builds the app bundle; this cask only links
  # it into /Applications, where Launchpad and Spotlight look (ADR 0002 in
  # the source repo). The URL mirrors the formula's tarball so version and
  # sha256 stay in sync with it; the bundle is not installed from that download.
  depends_on formula: "gianniacquisto/tap/tandem"
  depends_on macos: :tahoe

  postflight_steps do
    # A symlink at the versionless `opt` path, so `brew upgrade tandem` keeps
    # the app current with no second upgrade path. On uninstall, Homebrew
    # removes only a symlink pointing exactly at this source.
    symlink "{{HOMEBREW_PREFIX}}/opt/tandem/share/Tandem.app",
            "/Applications/Tandem.app",
            overwrite:           true,
            remove_on_uninstall: true
  end
end
