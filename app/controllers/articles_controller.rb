class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", expect: [:new, :create]
  def new
      @article = Article.new
  end

  def index
      @new_articles = Article.order(created_at: :desc).limit(5)
  end

  def create
      # 创建新的一篇文章
      @article = Article.new(article_params)

      # 保存到数据库
      @article.save
      #重定向到新建的文章
      redirect_to @article
  end

  def show
      @article = Article.find(params[:id])
  end

  private
    def article_params
        params.require(:article).permit(:title,:author,:content)
    end
end
