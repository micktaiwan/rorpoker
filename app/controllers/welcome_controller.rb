class WelcomeController < ApplicationController

  def index
    # show groups, last games, ...
    @last_games = Game.find(:all, :order=>'id desc', :limit=>10)
    @last_users = User.find(:all, :order=>'id desc', :limit=>10)
    @last_groups = Group.find(:all, :order=>'id desc', :limit=>10)
  end  

end
