require 'active_musicbrainz'
require 'ripl'
require 'yaml'
require "musicbrainz_cli/version"
require "musicbrainz_cli/commands"
require "musicbrainz_cli/info"
require "musicbrainz_cli/cli"

module MusicbrainzCli
  def self.init config_file_path
    config = YAML.load_file config_file_path
    ActiveRecord::Base.establish_connection config[:database]
    ActiveMusicbrainz.init
  end
end
