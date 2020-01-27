# frozen_string_literal: true

require 'active_record'

module HeyJony
  class Database
    # establish connection
    def self.connection(config, env = 'production')
      ActiveRecord::Base.configurations = config
      ActiveRecord::Base.establish_connection env.to_sym
      ActiveRecord::Base.time_zone_aware_attributes = true
    end
  end
end
