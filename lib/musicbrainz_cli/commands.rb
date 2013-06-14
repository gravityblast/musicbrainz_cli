module MusicbrainzCli
  module Commands
    def self.command name, &block
      define_method "command_#{name}", &block
    end

    command :tables do |pattern=""|
      regexp = Regexp.new pattern.to_s
      ActiveRecord::Base.connection.tables.find_all{|table_name| table_name =~ regexp}
    end

    command :info do
      puts Info.new
    end
  end
end
