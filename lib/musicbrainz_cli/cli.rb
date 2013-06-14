require 'logger'

module MusicbrainzCli
  class Stats
    def initialize
    end

    def to_s
      stats.collect do |key, value|
        "#{key} => #{value}"
      end.join "\n"
    end

    def stats
      @stats ||= build_stats
    end

    def build_stats
      @stats = {}
      tables = ActiveRecord::Base.connection.tables
      @stats['Tables Count'] = tables.count
      @stats['Tables'] = tables.join ', '
      @stats
    end
  end

  module Commands
    def self.command name, &block
      @commands ||= []
      define_method "command_#{name}", &block
    end

    command :tables do |pattern=""|
      regexp = Regexp.new pattern.to_s
    ActiveRecord::Base.connection.tables.find_all{|table_name| table_name =~ regexp}
    end

    command :models do

    end

    command :stats do
      puts Stats.new
    end
  end

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
