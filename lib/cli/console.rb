module Strava
  module Cli
    class Console < SimpleDelegator
      attr_reader :client

      def initialize(access_token)
        @client = Strava::Api::Client.new(access_token: access_token)
        super @client
      end

      def run(args)
        args.map do |arg|
          rc = eval(arg)
          puts rc
          rc
        end
      end

      def start!
        Ripl.start(binding: binding, prompt: 'Strava> ')
      end
    end
  end
end
