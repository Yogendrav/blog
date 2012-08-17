class ArticlesController < ApplicationController
	before_filter :authenticate_user!, :except => [:show, :index]
	def index
	@articles=Article.all
	end
	def show
		@article=Article.find(params[:id])
		@comment=Comment.new
		@comment.article_id = @article.id
		
	end
	def new
		@article=Article.new
	end	
	def create
		@article=Article.new(params[:article])
		@article.save
		redirect_to article_path(@article)
		end
	def edit
		@article=Article.find(params[:id])
	end
def update
	@article=Article.find(params[:id])
	@article.update_attributes(params[:article])
	flash[:message] = "Article '#{@article.title}'Updated!"
	redirect_to article_path(@article)
end
def destroy
	@article=Article.find(params[:id])
		if @article.delete
			flash[:message]="Hurrey! your comment is deleted"
		redirect_to :action=>'index'
	else
		render 'index'
	end
end
 def tag_list
  self.tags.collect do |tag|
    tag.name
  end.join(", ")
 end

end
