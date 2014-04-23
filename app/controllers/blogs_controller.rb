class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def create
    #scrape Blog URl
    #cal model thing that makes stuff
    @blog = Blog.create(blog_params)
    if text = @blog.webScrape(@blog.url)
      words = @blog.textToWords(text)
      @blog.update(top_words: words[0..20].join(","))

      redirect_to "/blogs/#{@blog.id}"
    else
      @blog.destroy
      flash[:alert] = "Sorry, that url didnt Work."
      redirect_to root_path
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @top_words = @blog.top_words.split(",")
  end
private
  def blog_params
    params.require(:blog).permit(:url)
  end
end
