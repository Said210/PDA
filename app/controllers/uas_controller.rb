class UasController < ApplicationController
  before_action :set_ua, only: [:show, :edit, :update, :destroy]

  # GET /uas
  # GET /uas.json
  def index
    @uas = Ua.all
  end

  # GET /uas/1
  # GET /uas/1.json
  def show
  end

  # GET /uas/new
  def new
    @ua = Ua.new
  end

  # GET /uas/1/edit
  def edit
  end

  # POST /uas
  # POST /uas.json
  def create
    @ua = Ua.new(ua_params)

    respond_to do |format|
      if @ua.save
        format.html { redirect_to @ua, notice: 'Ua was successfully created.' }
        format.json { render :show, status: :created, location: @ua }
      else
        format.html { render :new }
        format.json { render json: @ua.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uas/1
  # PATCH/PUT /uas/1.json
  def update
    respond_to do |format|
      if @ua.update(ua_params)
        format.html { redirect_to @ua, notice: 'Ua was successfully updated.' }
        format.json { render :show, status: :ok, location: @ua }
      else
        format.html { render :edit }
        format.json { render json: @ua.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uas/1
  # DELETE /uas/1.json
  def destroy
    @ua.destroy
    respond_to do |format|
      format.html { redirect_to uas_url, notice: 'Ua was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ua
      @ua = Ua.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ua_params
      params.require(:ua).permit(:nombre)
    end
end
