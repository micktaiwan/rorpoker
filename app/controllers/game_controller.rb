class GameController < ApplicationController

  def create_form
    @group = Group.find(params[:id])
    @group.init_settings
  end

  def create
    game = Game.new(params[:game])
    game.save
    redirect_to(:action=>:view, :id=>game.id)
  end
  
  def view
    @game = Game.find(params[:id])
    @group = @game.group
  end
  
  def edit_form
    @game = Game.find(params[:id])
  end

  def edit
    game = Game.find(params[:id])
    game.update_attributes(params[:game])
    game.save
    redirect_to(:action=>:view, :id=>game.id)
  end

end
