class PrototypesController < ApplicationController

  before_action  :move_to_index_for_edit, only: :edit
  before_action  :move_to_index_for_new, only: :new

  def index
    @prototypes = Prototype.all.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototypes_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end
  
  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
      @prototype = Prototype.find(params[:id])
    if @prototype.update(prototypes_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private
  def prototypes_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

    def move_to_index_for_new
      unless user_signed_in?
        redirect_to root_path
      end
    end

    def move_to_index_for_edit
      if user_signed_in?
        prototype = Prototype.find(params[:id])
        unless  prototype.user.id == current_user.id
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end


end
