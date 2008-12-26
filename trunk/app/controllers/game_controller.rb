class GameController < ApplicationController
  
  include LoginSystem
  before_filter :login_required, :except => [:view]
  
  def create_form
    @group = Group.find(params[:id])
    @group.init_settings
  end

  def create
    game = Game.new(params[:game])
    params[:players].each { |id|
      game.players << User.find(id.to_i)
      } if params[:players]
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
  
  def add_new_player
    begin
      # verifications
      user = session['user']
      render(:text=>'alert("Not loggued");') and return if not user
      group_id = params[:id]
      group = Group.find(group_id)
      render(:text=>'alert("User can not add player to this group");') and return if not group or not user.groups.include?(group)
      email   = params[:email]
      name    = params[:name]
      render(:text=>'alert("This name is taken");') and return if User.find_by_name(name)
      # is this email exists ?
      is_new  = User.find_by_email(email)
      player  = is_new || create_new_user(name,email,group)
      # player found or created
      player.groups << group if not player.groups.include?(group)
      player.save
      p = esc_js(render_to_string(:partial => "player", :object=>player))
      render(:text=>"display_new_player('#{p}');")
    rescue Exception => e
      render(:text=>'alert("'+e+'");')
    end
  end

private

  # for now here, move it to application helper if needed elsewhere
  def create_new_user(name,email,group)
    pass = ApplicationHelper.generate_password
    user = User.new({:email=>email, :name=>name, :password=>pass})
    AppMailer.deliver_added_new_player(session['user'],user,pass,group)
    user
  end
  
  def esc_js(js)
   (js || '').gsub(/(\r\n|\n|\r)+/, "\\n").gsub(/["']/) { |m| "\\#{m}" }
  end

end
