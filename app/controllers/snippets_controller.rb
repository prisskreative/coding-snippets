class SnippetsController < ApplicationController


  def index
  	@user = User.find current_user
  	@category = Category.find_by(id: params[:category_id])
    @snippet = @category.snippets.order(created_at: :desc).limit(10)
  end

  def show
  end

  def new
  	@category = Category.find_by(id: params[:category_id])
    @snippet = @category.snippets.new
  end

  def create
  	@category = Category.find_by(id: params[:category_id])
    @snippet = @category.snippets.new(snippet_params)
    @snippet.user = current_user
    
    if @snippet.save
		redirect_to category_snippets_path(@category)
	else
		render 'new'
	end
  end

   def update

   end



  def snippet_params
    params.require(:snippet).permit(:name, :description, :short_url, :tags)
  end

end
