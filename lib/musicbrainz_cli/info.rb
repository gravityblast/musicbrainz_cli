module MusicbrainzCli
  class Info
    def to_s
      info.collect do |key, value|
        "#{key} => #{value}"
      end.join "\n"
    end

    def info
      @info ||= build_info
    end

    def build_info
      @info = {}
      tables = ActiveRecord::Base.connection.tables
      @info['Tables count'] = tables.count
      @info
    end
  end
end
