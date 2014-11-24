require 'active_support/core_ext'
require 'konf'

pub_config = (YAML.load(ERB.new(File.read(File.expand_path('../config.yml',     __FILE__))).result)[Rails.env]) || {}
AppConfig = Konf.new(pub_config)
