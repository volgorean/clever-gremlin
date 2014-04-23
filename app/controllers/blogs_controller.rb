class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def create
    #scrape Blog URl
    #cal model thing that makes stuff
    @blog = Blog.create(blog_params)
    if text = @blog.web_scrape(@blog.url)
      words = @blog.text_to_words(text)
      paragraphs = @blog.word_size_over_time(text)
      x_over_time = @blog.p_to_scores(paragraphs)

      @blog.update(top_words: words[0..20].join(","))
      @blog.update(x_over_time: x_over_time.join(","))
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
    @x_over_time = @blog.x_over_time.split(",")
  end
private
  def blog_params
    params.require(:blog).permit(:url)
  end
end
