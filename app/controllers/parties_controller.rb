class PartiesController < ApplicationController

  before_filter :authenticate_user!, :only => [:create, :update, :destroy]
  load_and_authorize_resource

  def index
    @parties = Party.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @parties.as_json(:methods => [:coalition]) }
    end
  end
  
  def show
    @party = Party.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @party.as_json(:methods => [:coalition]) }
    end
  end

  def new
    @party = Party.new
    @party.coalitionships.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @party.as_json(:methods => [:coalition]) }
    end
  end

  def edit
    @party = Party.find(params[:id])
    @party.coalitionships.present? ? @party.coalitionships : @party.coalitionships.build
  end

  def create
    @party = Party.new(params[:party] || ActiveSupport::JSON.decode(request.body.read))

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Party was successfully created.' }
        format.json { render json: @party, status: :created, location: @party }
      else
        format.html { render action: "new" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @party = Party.find(params[:id])

    respond_to do |format|
      if @party.update_attributes(params[:party] || ActiveSupport::JSON.decode(request.body.read))
        format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @party = Party.find(params[:id])
    @party.destroy

    respond_to do |format|
      format.html { redirect_to parties_url }
      format.json { head :ok }
    end
  end
end
