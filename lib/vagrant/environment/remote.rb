module Vagrant
  class Environment
    module Remote

      def self.prepended(klass)
        klass.class_eval do
          attr_reader :client
        end
      end

      def initialize(opts={})
        super
        @client = opts[:client]
      end

      # This returns a machine with the proper provider for this environment.
      # The machine named by `name` must be in this environment.
      #
      # @param [Symbol] name Name of the machine (as configured in the
      #   Vagrantfile).
      # @param [Symbol] provider The provider that this machine should be
      #   backed by.
      # @param [Boolean] refresh If true, then if there is a cached version
      #   it is reloaded.
      # @return [Machine]
      def machine(name, provider, refresh=false)
        return @client.target(name)
      end
    end
  end
end
