# written by Carlos Monterrosa under GPL Licence
require 'yaml'
require 'net/https'
require 'uri'
require 'rubygems'



def external_ip
  external_ip=''
  uri = URI.parse('http://checkip.dyndns.org/')
  Net::HTTP.new(uri.host,uri.port).start { |http|
  http.request_get('/') { |resp|
    # The response looks like:
    #
    # Current IP Address: 81.155.100.200
    #
    external_ip = resp.read_body.gsub(/[^:]*: ([^<]*)<.*$/,"\\1")
    external_ip = external_ip.gsub(/\n/,'')
    return external_ip
  }
  }
end

### Main loop ##
@config = YAML.load_file("settings.yml")
client_hostname,server_hostname,server_port,server_user,server_password =@config['hostname'], @config['server_hostname'],@config['server_port'], @config['server_user'], @config['server_password']
system("curl -u #{server_user}:#{server_password} -H 'Accept: application/json' -H 'Content-type: application/json' -X PUT -d '{'host' : {'nombre': '#{client_hostname}', 'ip': '#{external_ip}'}}' http://#{server_hostname}:#{server_port}/hosts/update/#{client_hostname}")
