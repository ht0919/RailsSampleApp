class PostsController < ApplicationController
  def create
    if current_user.posts.create(post_params)
      flash[:notice] = 'Posts was successfully created.'
    else
      flash[:error] = 'Something went wrong'
    end

    redirect_to :root
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
