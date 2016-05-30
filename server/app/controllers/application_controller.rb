# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  # This is the list of IP ranges that are on the local subnet
  def local_ip_ranges
    @config = YAML.load_file("#{RAILS_ROOT}/config/database.yml")
    network = @config[RAILS_ENV]["networks"]
    network.split(" ")
  end

  # This is the method that checks if the given IP is in the above list
  def is_local(ip)
    require 'ipaddr'
    ip = IPAddr.new(ip)
    local_ip_ranges.any? {|range| IPAddr.new(range).include?(ip) }
  end
end
