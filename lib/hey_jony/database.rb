# frozen_string_literal: true

require 'active_record'

module HeyJony
  class Database
    # @param <string> config
    def initialize(config)
      @config = config
    end

    # establish connection
    def connection(env = 'production')
      ActiveRecord::Base.configurations = @config
      ActiveRecord::Base.establish_connection env.to_sym
    end
  end
end
