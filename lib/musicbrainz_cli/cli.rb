require 'logger'

module MusicbrainzCli
  class CLI
    include Commands
    include ActiveMusicbrainz::Model

    def initialize options={}
      ActiveRecord::Base.logger = Logger.new options[:logdev] if options[:logdev]
    end

    def loop
      Ripl.start binding: binding, prompt: 'MusicBrainz CLI > '
    end

    def method_missing m, *args, &block
      command_name =  "command_#{m}"
      if respond_to? command_name
        send command_name, *args
      else
        super
      end
    end
  end
end
