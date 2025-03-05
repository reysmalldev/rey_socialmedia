class User::PostsController < ApplicationController
  before_action :set_user_post, only: %i[ show edit update destroy ]

  # GET /user/posts or /user/posts.json
  def index
    @user_posts = User::Post.all
  end

  # GET /user/posts/1 or /user/posts/1.json
  def show
  end

  # GET /user/posts/new
  def new
    @user_post = User::Post.new
  end

  # GET /user/posts/1/edit
  def edit
  end

  # POST /user/posts or /user/posts.json
  def create
    @user_post = User::Post.new(user_post_params)

    respond_to do |format|
      if @user_post.save
        format.html { redirect_to @user_post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @user_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/posts/1 or /user/posts/1.json
  def update
    respond_to do |format|
      if @user_post.update(user_post_params)
        format.html { redirect_to @user_post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @user_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/posts/1 or /user/posts/1.json
  def destroy
    @user_post.destroy!

    respond_to do |format|
      format.html { redirect_to user_posts_path, status: :see_other, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_post
      @user_post = User::Post.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_post_params
      params.expect(user_post: [ :title, :content, :user_id ])
    end
end
