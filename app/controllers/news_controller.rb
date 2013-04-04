class NewsController < ApplicationController
  respond_to :html

  def index
    params[:user_id].blank? ? @news = News.order('created_at DESC').page(params[:page]) : @news = News.where(user_id: params[:user_id]).order('created_at DESC').page(params[:page])
    respond_with @news
  end

  def show
    begin
      @news = News.find(params[:id])
    rescue
      flash[:error] = 'Invalid news.'
      redirect_to root_url
    else
      respond_with @news
    end
  end

  def new
    respond_with @news = News.new
  end

  def create
    @news = News.new(params[:news])
    respond_with(@news) do |format|
      if @news.save
        flash[:success] = 'News was successefully created.'
        format.html { redirect_to @news }
      else
        format.html { render :action => :new }
      end
    end
  end

  def edit
    respond_with @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    respond_with(@news) do |format|
      if @news.update_attributes(params[:news])
        flash[:success] = 'News was successefully updated.'
        format.html { redirect_to @news }
      else
        format.html { render :action => :edit }
      end
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    flash[:success] = 'News was successefully destroyed.'
    redirect_to root_url
  end
end
