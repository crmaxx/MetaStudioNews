class VotesController < ApplicationController
  respond_to :html

  def new
    @vote = Vote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vote }
    end
  end

  def create
    @vote = Vote.new(params[:vote])
    nid = params[:vote][:news_id].to_i
    uid = params[:vote][:user_id].to_i
    @count = Vote.where(news_id: nid, user_id: uid).count

    if @count == 0
      respond_to do |format|
        if @vote.save
          #flash[:success] = 'You have successfully voted.'
          format.js
          format.html { redirect_to news_path }
        else
          #flash[:error] = 'You can vote only once.'
          format.html { redirect_to news_path }
          format.xml  { render :xml => @vote.errors, :status => :unprocessable_entity }
        end
      end
    else
      render js: "alert('You may vote once for any one news.');"
    end
  end
end
