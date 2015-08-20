module Dashboard
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :get_tags, only: [:new, :edit]

    # GET /dashboard/posts
    # GET /dashboard/posts.json
    def index
      if params[:query].present?
        @posts = current_user.posts.search(params[:query])
      else
        @posts = current_user.posts.published.order(created_at: :desc)
      end
    end

    def unpublished
      @posts = current_user.posts.unpublished
    end

    def switch_status
      @post = Post.find(params[:post_id])
      @post.switch_status
      
      redirect_to :back
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

      respond_to do |format|
        if @post.save
          format.html { redirect_to dashboard_posts_path, notice: 'Post was successfully created.' }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /dashboard/posts/1
    # PATCH/PUT /dashboard/posts/1.json
    def update
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to dashboard_posts_path, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /dashboard/posts/1
    # DELETE /dashboard/posts/1.json
    def destroy
      @post.destroy
      respond_to do |format|
        format.html { redirect_to dashboard_posts_path, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

      def json_request?
        request.format.symbol == :json
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = current_user.posts.find(params[:id])
      end

      def get_tags
        @tags = Post.select(:tag).uniq
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def post_params
        params.require(:post).permit(:title, :short, :content, :tag, :image)
      end
  end
end
