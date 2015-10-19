class SecrettokensController < ApplicationController
  before_action :set_secrettoken, only: [:show, :edit, :update, :destroy]
  # GET /secrettokens
  # GET /secrettokens.json
  def index
    @secrettokens = Secrettoken.all
  end

  # GET /secrettokens/1
  # GET /secrettokens/1.json
  def show
  end

  # GET /secrettokens/new
  def new
    @dropdown = [1, 10, 20, 50, 100]
    @secrettoken = Secrettoken.new    
  end

  # GET /secrettokens/1/edit
  def edit
  end

  # POST /secrettokens
  # POST /secrettokens.json
  def create
    params[:secrettoken][:stoken].to_i.times do
      @secrettoken =   Secrettoken.new
      @secrettoken.code = (0...8).map { (65 + rand(26)).chr }.join
      @secrettoken.save
    end

    respond_to do |format|
      if @secrettoken
        format.html { redirect_to secrettokens_url, notice: 'Secrettoken was successfully created.' }
        format.json { render :show, status: :created, location: @secrettoken }
      else
        format.html { render :new }
        format.json { render json: @secrettoken.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secrettokens/1
  # PATCH/PUT /secrettokens/1.json
  def update
    respond_to do |format|
      if @secrettoken.update(secrettoken_params)
        format.html { redirect_to @secrettoken, notice: 'Secrettoken was successfully updated.' }
        format.json { render :show, status: :ok, location: @secrettoken }
      else
        format.html { render :edit }
        format.json { render json: @secrettoken.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secrettokens/1
  # DELETE /secrettokens/1.json
  def destroy
    @secrettoken.destroy
    respond_to do |format|
      format.html { redirect_to secrettokens_url, notice: 'Secrettoken was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_secrettoken
    @secrettoken = Secrettoken.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def secrettoken_params
    params.require(:secrettoken).permit(:code,:stoken)
  end
end
