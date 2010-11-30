class Ldapi::Backend
  
  ATTRS = [ "objectclass", 
            "givenname", 
            "sn", 
            "objectclass", 
            'apple-imhandle', 
            'cn', 
            'gidnumber', 
            # 'jpegphoto', 
            'mail', 
            'uid', 
            'uidnumber', 
            'homedirectory' ]

  
  def initialize
    @ldap = Net::LDAP.new(  :host => Ldapi.configuration.ldap_server,
                            :port => 389 )
  end
  
  def search(uid)
    result = {}
    filter = Net::LDAP::Filter.eq( "uid", uid )
    @ldap.search( :base => Ldapi.configuration.search_base, :filter => filter, :attributes => ATTRS ) do |entry|
      entry.each do |attribute, values|
        if values.size == 1
          result[attribute] = values.first
        else
          result[attribute] = values
        end
      end
    end
    result
  end
  
end