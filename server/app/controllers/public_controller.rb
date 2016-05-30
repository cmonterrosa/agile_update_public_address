class PublicController < ApplicationController
  before_filter :protect
  layout 'hosts'
  
  def show
    @hosts = Host.find(:all, :order => "nombre")
  end

 private
  def protect
      unless is_local(request.remote_ip)
          render :text => "No tiene permisos para acceder"
          return false
      end
  end

end
