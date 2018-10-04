class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:impart]
  before_action :presidente_only, except: [:show]

  # GET /professors
  # GET /professors.json
  def index
    @professors = Professor.all
  end

  # GET /professors/1
  # GET /professors/1.json
  def show
  end

  # GET /professors/new
  def new
    @professor = Professor.new
  end

  # GET /professors/1/edit
  def edit
  end

  
  def impart_ui
    @p = Professor.find(params[:id])
    @m = Impart.new
    _uas = Ua.all
    uas = []
    for m in @p.get_uas
      uas.push m.ua
    end
    @uas = _uas - uas
    render :imparts_form
  end
  
  def impart
    @p = Professor.find(params[:pid])
    @ua = Ua.find(params[:uid])
    @m = @p.impart @ua, params[:title]
    render json: @m
  end
  
  # POST /professors
  # POST /professors.json
  def create
    @professor = Professor.new(professor_params)

    respond_to do |format|
      if @professor.save
        format.html { redirect_to @professor, notice: 'Professor was successfully created.' }
        format.json { render :show, status: :created, location: @professor }
      else
        format.html { render :new }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professors/1
  # PATCH/PUT /professors/1.json
  def update
    respond_to do |format|
      if @professor.update(professor_params)
        format.html { redirect_to @professor, notice: 'Professor was successfully updated.' }
        format.json { render :show, status: :ok, location: @professor }
      else
        format.html { render :edit }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @professor.destroy
    respond_to do |format|
      format.html { redirect_to professors_url, notice: 'Professor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = Professor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professor_params
      params.require(:professor).permit(:name, :lname, :lname2, :worker, :email, :phone)
    end
    
    def presidente_only
        if user_signed_in? && current_user.presidente?
          return true
        else
          flash[:notice] = 'Sin permiso para esta sección'
          redirect_to :root
        end
    end
end
