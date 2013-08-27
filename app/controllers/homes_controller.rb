class HomesController < ApplicationController
  # GET /homes
  # GET /homes.json
  
  include RottenTomatoes
  def index
    Rotten.api_key = "9zumcg5xarr8nw3urcz6gj69"
	@type_movie=params[:type_path]
	@search=params[:search]
	if(params[:type_path]==nil)
		@movie = RottenList.find(:type => "in_theaters")
	else
		@movie = RottenList.find(:type => params[:type_path])
	end
	if(!@search.nil?)
		render :partial=>"list"
	end
  end

  # GET /productts/1
  # GET /productts/1.json
  def show
    Rotten.api_key = "9zumcg5xarr8nw3urcz6gj69"
    @movie = RottenMovie.find(:id => params[:id]) #params[:id]) #RottenList.find(:id=>771267761)
	@movie_id = params[:id]
	@comments = Comment.find_all_by_movie_id(params[:id])
  end
  
  # GET /homes/new
  # GET /homes/new.json
  def new
    @home = Home.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @home }
    end
  end

  # GET /homes/1/edit
  def edit
    @home = Home.find(params[:id])
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(params[:home])
    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render json: @home, status: :created, location: @home }
      else
        format.html { render action: "new" }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /homes/1
  # PUT /homes/1.json
  def update
    @home = Home.find(params[:id])

    respond_to do |format|
      if @home.update_attributes(params[:home])
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home = Home.find(params[:id])
    @home.destroy

    respond_to do |format|
      format.html { redirect_to homes_url }
      format.json { head :no_content }
    end
  end
end
