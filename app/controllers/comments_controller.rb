class CommentsController < ApplicationController
  # Настроим фильтры. Нам нужно, во-первых, задать родительский article
  # чтобы понимал откуда удалять?
  # before_action :set_article, only: [:create, :destroy]

  # только для удаления, чтобы знать, какой коммент сносить:
  before_action :set_comment, only: [:destroy]

  # POST /comments
  def create
    # Создаём объект @comment из @article
    @comment = @article.comments.build(comment_params)
    # Проставляем пользователя, если он задан
    @comment.user = current_user

    if @comment.save
      redirect_to @comment, notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = @article.comments.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:user_name, :text)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
