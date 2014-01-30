class CommentsController < ApplicationController

	def new
  	@article = Article.find(params[:article_id])
  	@user = User.find(params[:user_id])
  	@comment = Comment.new
	end

	private

	def comment_params
    params.require(:comment).permit(:body)
  end
end
