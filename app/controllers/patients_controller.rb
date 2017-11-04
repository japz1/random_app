class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.search(params[:search]).order(created_at: :desc).page params[:page]

    @patients_scv = Patient.all
      respond_to do |format|
      format.html
      format.csv { send_data @patients_scv.to_csv}
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:name, :age, :sex, :identification, :modality, :catheter, :caliber, 
                                      :qualitative_scale, :user_id, :number_punctures, :catheter_exchange,
                                      :oncological, :cardiovascular, :recent_intravenous_treatment, :injection_speed,
                                      :change_speed_injection, :injury, :injury_type, :fhlebitis, :fhlebitis_type,
                                      :puncture, :blood_exposure, :blood_exposure_type, :insertion_pain,
                                      :administration_pain, :type_procedure, :rupture, :complete_record)
    end

end
