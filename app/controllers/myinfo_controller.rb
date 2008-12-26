class MyinfoController < ApplicationController
  include LoginSystem
  before_filter :login_required
  skip_before_filter :verify_authenticity_token

  def index
    @user = session['user']
  end

  verify :method => :post, :only => [:update ], :redirect_to => { :action => :index }

  # Ajaxed
  def update
    begin
      u = User.find(session['user']['id'])
      render(:text=>I18n.t(:errors_name_taken)) and return  if [] != User.find(:all,:conditions=>["id != ? and name = ?",u.id,params[:user][:name]])
      render(:text=>I18n.t(:errors_email_taken)) and return if [] != User.find(:all,:conditions=>["id != ? and email = ?",u.id,params[:user][:email]])
      u.update_attributes!(params[:user]) # raise an error
      session['user'] = u
      render(:text=>'0')
    rescue Exception=>e
      render(:text=>e.message)
    end
  end
   
end

