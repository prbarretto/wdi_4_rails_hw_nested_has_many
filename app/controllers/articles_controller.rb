class ArticlesController < ApplicationController




	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.new(article_params)
		if article.save
			flash[:notice] = 'Your article has been updated.'
			redirect_to @article
		else
			flash.now[:error] = @article.errors.full_messages
      render :edit
    end
	end

	def new
  	@user = User.find(params[:user_id])
  	@article = Article.new
	end

	def create
		@user = User.find(params[:user_id])
    @user.articles << article = Article.create!(article_params)
    redirect_to user_path(@user.id)
  end

	private

	 def article_params
    params.require(:article).permit(:title, :body, :user_id)
   end

end
