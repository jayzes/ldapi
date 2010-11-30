module Ldapi
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration    
    attr_accessor :ldap_server, 
                  :search_base
    
  end
end