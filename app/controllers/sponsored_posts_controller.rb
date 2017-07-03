class SponsoredPostsController < ApplicationController
  def show
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsoredpost = SponsoredPost.new
  end

  def create
    @sponsoredpost = SponsoredPost.new
    @sponsoredpost.title = params[:sponsored_post][:title]
    @sponsoredpost.body = params[:sponsored_post][:body]
    @sponsoredpost.price = params[:sponsored_post][:price]
    @topic = Topic.find(params[:topic_id])
    @sponsoredpost.topic = @topic

    if @sponsoredpost.save
      flash[:notice] = "Sponsoredp post was saved."
      redirect_to [@topic, @sponsoredpost]
    else
      flash[:error] = "There was an error saving the sponsored post. Please try again."
      render :new
    end
  end

  def edit
    @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def update
    @sponsoredpost = SponsoredPost.find(params[:id])
    @sponsoredpost.title = params[:sponsored_post][:title]
    @sponsoredpost.body = params[:sponsored_post][:body]
    @sponsoredpost.price = params[:sponsored_post][:price]

    if @sponsoredpost.save
      flash[:notice] = "Sponsored post was updated."
      redirect_to [@sponsoredpost.topic, @sponsoredpost]
    else
      flash[:error] = "There was an error saving the sponsored post. Please try again."
      render :edit
    end
  end

  def destroy
    @sponsoredpost = SponsoredPost.find(params[:id])

    # #8
    if @sponsoredpost.destroy
      flash[:notice] = "\"#{@sponsoredpost.title}\" was deleted successfully."
      redirect_to @sponsoredpost.topic
    else
      flash[:error] = "There was an error deleting the sponsored post."
      render :show
    end
  end
end
