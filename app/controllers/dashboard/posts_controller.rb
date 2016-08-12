module Dashboard
  class PostsController < ApplicationController
    
    def index
      if params[:query].present?
        @posts = current_user.posts.search(params[:query])
      else
        @posts = current_user.posts.published
      end

      export_to_csv
    end

    def show
      set_post
    end

    def new
      get_uniq_tags
      @post = Post.new
    end

    def edit
      get_uniq_tags
      set_post
    end

    def create
      @post = current_user.posts.new(post_params)

      if @post.save!
        @post.update_tags(perform_tags_array)
        redirect_to unpublished_dashboard_posts_path
      else
        redirect_to :back
      end
    end

    def update
      set_post
      if @post.update(post_params) && @post.update_tags(perform_tags_array)
        redirect_to dashboard_post_path(@post)
      else
        redirect_to :back
      end
    end

    def destroy
      set_post
      @post.archived!
      redirect_to :back
    end

    def unpublished
      @posts = current_user.posts.unpublished
      export_to_csv
    end

    def archived
      @posts = current_user.posts.archived
      export_to_csv
    end

    def destroy_all_archived
      current_user.posts.archived.destroy_all
      redirect_to :back
    end

    def switch_status
      find_post_with_post_id
      @post.switch_status
      redirect_to :back
    end

    def generate_url
      find_post_with_post_id
      @post.generate_url(@post.title)
      redirect_to dashboard_post_path(id: @post.slug)
    end

    def reset_publication_date
      find_post_with_post_id
      @post.reset_publication_date
      redirect_to dashboard_posts_path
    end

    private

    def find_post_with_post_id
      @post = Post.find(params[:post_id])
    end

    def json_request?
      request.format.symbol == :json
    end

    def set_post
      @post = current_user.posts.friendly.find(params[:id])
    end

    def get_uniq_tags
      @tags = Post.select(:tag).uniq
    end

    def post_params
      params.require(:post).permit(:title, :short, :content, :image, :name)
    end

    def perform_tags_array
      params[:post][:tags].split(',')
    end

    def export_to_csv
      respond_to do |format|
        format.html
        format.csv { send_data @posts.to_csv }
      end
    end
  end
end
