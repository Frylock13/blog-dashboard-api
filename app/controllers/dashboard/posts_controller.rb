module Dashboard
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :get_tags, only: [:new, :edit]
    before_action :tags_array, only: [:update, :create]

    # GET /dashboard/posts
    # GET /dashboard/posts.json
    def index
      if params[:query].present?
        @posts = current_user.posts.search(params[:query])
      else
        @posts = current_user.posts.published
      end
    end

    def unpublished
      @posts = current_user.posts.unpublished
    end

    def archived
      @posts = current_user.posts.archived
    end

    def destroy_all_archived
      current_user.posts.archived.destroy_all
      redirect_to :back
    end

    def switch_status
      @post = Post.find(params[:post_id])
      @post.switch_status

      redirect_to :back
    end

    def generate_url
      @post = Post.friendly.find(params[:post_id])
      @post.generate_url(@post.title)

      redirect_to dashboard_post_path(id: @post.id)
    end

    # GET /dashboard/posts/1
    # GET /dashboard/posts/1.json
    def show
    end

    # GET /dashboard/posts/new
    def new
      @post = Post.new
    end

    # GET /dashboard/posts/1/edit
    def edit
    end

    # POST /dashboard/posts
    # POST /dashboard/posts.json
    def create
      @post = current_user.posts.new(post_params)

      if @post.save!
        @post.update_tags(@tags_array)
        redirect_to unpublished_dashboard_posts_path
      else
        redirect_to :back
      end
    end

    # PATCH/PUT /dashboard/posts/1
    # PATCH/PUT /dashboard/posts/1.json
    def update
      if @post.update(post_params) && @post.update_tags(@tags_array)
        redirect_to dashboard_posts_path
      else
        redirect_to :back
      end
    end

    # DELETE /dashboard/posts/1
    # DELETE /dashboard/posts/1.json
    def destroy
      if @post.archived!
        redirect_to dashboard_posts_path
      else
        redirect_to :back
      end
    end

    private

    def json_request?
      request.format.symbol == :json
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = current_user.posts.friendly.find(params[:id])
    end

    def get_tags
      @tags = Post.select(:tag).uniq
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :short, :content, :image, :name)
    end

    def tags_array
      @tags_array = params[:post][:tags].split(',')
    end
  end
end
