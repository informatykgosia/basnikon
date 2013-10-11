#encoding: UTF-8
class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.json

  before_filter :find_authors, :only => [:new, :edit, :update, :create]
  before_filter :authenticate, :except => [:index, :show]
  def index
    @stories = Story.all.sort_by{|s| s.title}
    @all_stories = Story.all.group_by { |h| h.title[0].upcase }
    @stories_by_letter = @stories.group_by{ |s| s.title.first.upcase}.sort

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])
    
 #  @author=Author.find(@story.author_id)
   @heros = @story.heros
   @heros_by_letter= @heros.group_by{ |n| n.name.first.upcase}.sort


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.json
  def new
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
    @story.title.capitalize!
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story])
    @story.title[0]=@story.title[0].capitalize

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Nowa baśń została dodana.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])
    

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Zmiany zostały zapisane.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :no_content }
    end
  end
  protected
    def find_authors
        @authors = Author.find(:all).map do |author|
          [author.first_name + ' ' + author.last_name, author.id]
        end
    end
end
