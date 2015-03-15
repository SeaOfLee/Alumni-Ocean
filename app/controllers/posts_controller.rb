class PostsController < ApplicationController
  before_filter :authorize

  def search
    if params[:search].present?
      @posts = Post.search params[:search],
      fields: [{title: :word_middle},
              {content: :word_middle}
            ]
      @posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    else
      @posts = Post.all
      @posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    end
  end

  def index
    @posts = Post.all
    @posts = Post.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end

  private
    def post_params
          params.require(:post).permit(:title, :content)
    end
end
