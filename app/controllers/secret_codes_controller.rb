class SecretCodesController < ApplicationController
  before_action :set_secret_code, only: [:show, :edit, :update, :destroy]
  # GET /secret_codes
  # GET /secret_codes.json
  def index
    @secret_codes = SecretCode.all
  end

  # GET /secret_codes/1
  # GET /secret_codes/1.json
  def show
  end

  # GET /secret_codes/new
  def new
    @dropdown = [1, 10, 20, 50, 100]
    @secret_code = SecretCode.new
  end

  # GET /secret_codes/1/edit
  def edit
  end

  # POST /secret_codes
  # POST /secret_codes.json
  def create
    
    params[:secrettoken][:no_times].to_i.times do
      @secret_code =   SecretCode.new
      @secret_code.code =  params[:secrettoken][:code]
      @secret_code.save
    end

    respond_to do |format|
      if @secret_code
        format.html { redirect_to @secret_code, notice: 'Secret code was successfully created.' }
        format.json { render :show, status: :created, location: @secret_code }
      else
        format.html { render :new }
        format.json { render json: @secret_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secret_codes/1
  # PATCH/PUT /secret_codes/1.json
  def update
    respond_to do |format|
      if @secret_code.update(secret_code_params)
        format.html { redirect_to @secret_code, notice: 'Secret code was successfully updated.' }
        format.json { render :show, status: :ok, location: @secret_code }
      else
        format.html { render :edit }
        format.json { render json: @secret_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secret_codes/1
  # DELETE /secret_codes/1.json
  def destroy
    @secret_code.destroy
    respond_to do |format|
      format.html { redirect_to secret_codes_url, notice: 'Secret code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_secret_code
    @secret_code = SecretCode.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def secret_code_params
    params.require(:secret_code).permit(:code,:no_of_times)
  end
end
