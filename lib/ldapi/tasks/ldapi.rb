task :example do
  
  require 'net/ldap'
  
  server = 'ldap.factorylabs.com'
  ldap = Net::LDAP.new( :host => server,
                        :port => 389 )
  
  filter = Net::LDAP::Filter.eq( "uid", "jayzeschin" )
  treebase = "cn=users,dc=ldap,dc=factorylabs,dc=com"
  attrs = [ "objectclass", 
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

  ldap.search( :base => treebase, :filter => filter, :attributes => attrs ) do |entry|
    puts "DN: #{entry.dn}"
    entry.each do |attribute, values|
      puts "   #{attribute}:"
      values.each do |value|
        puts "      --->#{value}"
      end
    end
  end

  p ldap.get_operation_result
end
