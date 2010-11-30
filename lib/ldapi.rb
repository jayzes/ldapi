require "rubygems"
require "bundler"
Bundler.setup :default
Bundler.require :default

module Ldapi
end

require File.expand_path(File.join(File.dirname(__FILE__), 'ldapi', 'configuration'))
require File.expand_path(File.join(File.dirname(__FILE__), 'ldapi', 'backend'))
require File.expand_path(File.join(File.dirname(__FILE__), 'ldapi', 'application'))