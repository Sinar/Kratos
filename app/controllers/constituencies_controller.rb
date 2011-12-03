class ConstituenciesController < ApplicationController
  # GET /constituencies
  # GET /constituencies.json
  def index
    @constituencies = Constituency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @constituencies }
    end
  end

  # GET /constituencies/1
  # GET /constituencies/1.json
  def show
    @constituency = Constituency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @constituency }
    end
  end

  # GET /constituencies/new
  # GET /constituencies/new.json
  def new
    @constituency = Constituency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @constituency }
    end
  end

  # GET /constituencies/1/edit
  def edit
    @constituency = Constituency.find(params[:id])
  end

  # POST /constituencies
  # POST /constituencies.json
  def create
    @constituency = Constituency.new(params[:constituency])

    respond_to do |format|
      if @constituency.save
        format.html { redirect_to @constituency, notice: 'Constituency was successfully created.' }
        format.json { render json: @constituency, status: :created, location: @constituency }
      else
        format.html { render action: "new" }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /constituencies/1
  # PUT /constituencies/1.json
  def update
    @constituency = Constituency.find(params[:id])

    respond_to do |format|
      if @constituency.update_attributes(params[:constituency])
        format.html { redirect_to @constituency, notice: 'Constituency was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constituencies/1
  # DELETE /constituencies/1.json
  def destroy
    @constituency = Constituency.find(params[:id])
    @constituency.destroy

    respond_to do |format|
      format.html { redirect_to constituencies_url }
      format.json { head :ok }
    end
  end
end
