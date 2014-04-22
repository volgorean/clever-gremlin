class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def create
    #scrape Blog URl
    #cal model thing that makes stuff
    @blog = Blog.create(blog_params)
    if @blog.webScrape(@blog.url)

    else
      @blog.destroy
      flash[:alert] = "Sorry, that url didnt Work."
    end
    redirect_to root_path
  end

private
  def blog_params
    params.require(:blog).permit(:url)
  end
end
