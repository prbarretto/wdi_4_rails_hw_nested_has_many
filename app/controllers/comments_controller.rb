class CommentsController < ApplicationController

	def new
  	@article = Article.find(params[:article_id])
  	@user = User.find(params[:user_id])
  	@comment = Comment.new
	end

	def create
		@user = User.find(params[:user_id])
		@article = Article.find(params[:article_id])
		@article.comments << comment = Comment.create!(comment_params)
		redirect_to user_article_path(@user.id, @article.id)
	end

	private

	def comment_params
    params.require(:comment).permit(:body)
  end
end
