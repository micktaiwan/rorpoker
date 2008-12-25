class GroupController < ApplicationController

  def create
    group = Group.new(params[:group])
    group.init_settings # will save the group
    join(group.id)
  end
  
  def view
    @group = Group.find(params[:id])
  end
  
  def edit_form
    @group = Group.find(params[:id])
  end

  def edit
    group = Group.find(params[:id])
    group.update_attributes(params[:group])
    group.save
    redirect_to(:action=>:view, :id=>group.id)
  end

  def join(id=0)
    g = Group.find(params[:id] || id)
    session['user'].groups << g if not session['user'].groups.include?(g)
    redirect_to(:action=>:view, :id=>g.id)
 end

  
end
