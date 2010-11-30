require 'sinatra'
require 'json'
require 'net/ldap'

module Ldapi
end

require File.expand_path(File.join(File.dirname(__FILE__), 'ldapi', 'configuration'))
require File.expand_path(File.join(File.dirname(__FILE__), 'ldapi', 'backend'))
require File.expand_path(File.join(File.dirname(__FILE__), 'ldapi', 'application'))