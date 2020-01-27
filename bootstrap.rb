# frozen_string_literal: true

BASE_DIR = __dir__
$LOAD_PATH.unshift File.expand_path('./lib', BASE_DIR)

require 'dotenv/load'
require 'erb'
require 'hey_jony/database'

# db connection
config = YAML.safe_load(ERB.new(IO.read(File.expand_path('./config/database.yml', BASE_DIR))).result)
HeyJony::Database.connection config
