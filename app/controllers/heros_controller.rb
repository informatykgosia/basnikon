#encoding:utf-8
class HerosController < ApplicationController
  # GET /heros
  # GET /heros.json
  before_filter :find_stories, :only => [:new, :edit, :update, :create]
  before_filter :authenticate, :except => [:index, :show]
  autocomplete :story, :title
  @tags = Hero.tag_counts_on(:tags)
  def index
	@all_heros = Hero.all.group_by { |h| h.name[0].upcase }
    if params[:tag_name]
      @heros = Hero.tagged_with(params[:tag_name]).group_by{ |h| h.name[0].upcase}
    elsif params[:letter]
      @heros = Hero.by_letter(params[:letter]).group_by{ |h| h.name[0].upcase}
    else
      @heros = Hero.all.group_by{ |h| h.name[0].upcase}
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @heros }
    end
  end

    # GET /heros/1
    # GET /heros/1.json
    def show
      @hero = Hero.find(params[:id])
      @story=Story.find(@hero.story_id)
      @authors=@story.authors
      @comments = @hero.comments
      @comment = Comment.new
      @illustrations = @hero.illustrations
      @illustration = Illustration.new
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @hero }
      end
    end

    # GET /heros/new
    # GET /heros/new.json
    def new
      @hero = Hero.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @hero }
      end
    end

    # GET /heros/1/edit
    def edit
      @hero = Hero.find(params[:id])
    end

    # POST /heros
    # POST /heros.json
    def create
      @hero = Hero.new(params[:hero])
      @hero.user = current_user
        if @hero.save
         redirect_to @hero, notice: 'Nowy bohater został utworzony.'
        else
        render action: "new"
        end
    end

    # PUT /heros/1
    # PUT /heros/1.json
    def update
      @hero = Hero.find(params[:id])

      respond_to do |format|
        if @hero.update_attributes(params[:hero])
          format.html { redirect_to @hero, notice: 'Bohater został zaktualizowany.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @hero.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /heros/1
    # DELETE /heros/1.json
    def destroy
      @hero = Hero.find(params[:id])
      @hero.destroy

      respond_to do |format|
        format.html { redirect_to heros_url }
        format.json { head :no_content }
      end
    end
    protected
    def find_stories
    @stories = Story.all.sort_by{|s| s.title}
      @stories =@stories.map do |story|
        [story.title, story.id]
      end
    end
  end
