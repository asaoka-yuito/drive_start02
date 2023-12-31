class Admin::PostsController < Admin::BaseController
  before_action :logged_in_user, only: %i[:index, :edit, :update, :destroy]
    before_action :set_post, only: %i[show edit update destroy]

    def index
      @search = Post.ransack(params[:q])
      @posts = @search.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
    end
  
    def show; end
    
    def edit; end
  
    def update
      if @post.update(post_params)
        redirect_to admin_post_path(@post), success: t('defaults.message.updated', item: Board.model_name.human)
      else
        flash.now[:danger] = t('defaults.message.not_updated', item: Board.model_name.human)
        render :edit
      end
    end
  
    def destroy
      @post.destroy!
      redirect_to admin_posts_path, success: t('defaults.message.deleted', item: Board.model_name.human)
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :body, :post_image, :post_image_cache)
    end
end
