class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
  	@user = User.find current_user
    @categories = @user.categories.order(created_at: :desc).limit(10)
    @category = @user.categories.new
    @snippets = @user.snippets.order(created_at: :desc).limit(10)
  end

  def show
  	@user = User.find current_user
    @category = Category.find(params[:id])
  end

  def new
  	@user = User.find current_user
    @category = @user.categories.new
  end

  def create
  	@user = User.find_by(id: current_user)
    @category = @user.categories.new(category_params) 

    unless @category.save
      render(:new)
    else
      redirect_to(categories_path(user_id: @user))
    end
  end

    def edit
        @user = User.find current_user
        @category = @user.categories.find params[:id]
        render(:edit)
    end

    def update
        @user = User.find current_user
        @category = @user.categories.find params[:id]

        if @category.update(category_params)
          redirect_to action: 'index', controller: 'categories', 
          user_id: @user.id
        else
          render 'edit'
        end
    end

    def destroy
        @user = User.find current_user
        @category = @user.categories.find params[:id]
        
        @category.destroy
        redirect_to action: 'index', controller: 'categories', 
        user_id: @user.id      
    end

    def category_params
        params.require(:category).permit(:name)
    end



end
