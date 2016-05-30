class PublicController < ApplicationController
  before_filter :protect
  layout 'hosts'
  
  def show
    @hosts = Host.find(:all, :order => "nombre")
  end

 private
  def protect
      if request.remote_ip !~ /^172.\d{2,3}.\d{2,3}.\d{2,3}$/
          render :text => "No tiene permisos para acceder"
          return false
      end
  end

end
