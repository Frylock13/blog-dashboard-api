class Dashboard::PostsController < ApplicationController
  before_action :set_dashboard_post, only: [:show, :edit, :update, :destroy]
  before_action :get_tags, only: [:tags, :new, :edit]
  before_filter :require_login, unless: :json_request?

  # GET /dashboard/posts
  # GET /dashboard/posts.json
  def index
    if params[:query].present?
      @dashboard_posts = Dashboard::Post.search(params[:query])
    else
      @dashboard_posts = Dashboard::Post.published.order(created_at: :desc)
    end
  end

  def unpublished
    @dashboard_posts = Dashboard::Post.unpublished
  end

  def tags
  end

  def set_tag
    @dashboard_posts = Dashboard::Post.tag(params[:name]).published
  end

  def switch_status
    @post = Dashboard::Post.find(params[:post_id])
    @post.switch_status
    
    redirect_to :back
  end

  # GET /dashboard/posts/1
  # GET /dashboard/posts/1.json
  def show
  end

  # GET /dashboard/posts/new
  def new
    @dashboard_post = Dashboard::Post.new
  end

  # GET /dashboard/posts/1/edit
  def edit
  end

  # POST /dashboard/posts
  # POST /dashboard/posts.json
  def create
    @dashboard_post = Dashboard::Post.new(dashboard_post_params)

    respond_to do |format|
      if @dashboard_post.save
        format.html { redirect_to @dashboard_post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @dashboard_post }
      else
        format.html { render :new }
        format.json { render json: @dashboard_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/posts/1
  # PATCH/PUT /dashboard/posts/1.json
  def update
    respond_to do |format|
      if @dashboard_post.update(dashboard_post_params)
        format.html { redirect_to @dashboard_post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @dashboard_post }
      else
        format.html { render :edit }
        format.json { render json: @dashboard_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/posts/1
  # DELETE /dashboard/posts/1.json
  def destroy
    @dashboard_post.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def json_request?
      request.format.symbol == :json
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_dashboard_post
      @dashboard_post = Dashboard::Post.find(params[:id])
    end

    def get_tags
      @tags = Dashboard::Post.select(:tag).uniq
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dashboard_post_params
      params.require(:dashboard_post).permit(:title, :short, :content, :tag, :image)
    end
end
