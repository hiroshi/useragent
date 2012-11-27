# On the user side point of view, platform nor os is non
class UserAgent
  module Friendly
    def friendly
      @friendly ||= Friend.new(self)
    end

    class Friend
      def initialize(agents)
        @agents = agents
      end

      def device
        case @agents.platform
        when 'Macintosh'
          'Mac'
        when 'Symbian'
          @agents[0].to_s.split("/")[0]
        when 'webOS'
          "Palm " + @agents[-1].to_s.split("/")[0]
        when 'Linux'
          if @agents.os =~ /^Android/
            @agents[0].to_s[/; ([^;]+) Build/, 1]
          else
            @agents.platform
          end
        when 'X11'
          @agents.os.sub(/\s+(i\d86)$/, "")
        when nil
          case @agents[0]
          when /(Googlebot|bingbot)/
            $1
          end
        else
          @agents.platform
        end
      end

      def as_json(options = nil)
        {:device => self.device}
      end
    end
  end
end
