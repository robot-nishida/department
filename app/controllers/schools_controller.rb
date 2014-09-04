class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /schools
  # GET /schools.json
  def index

    @all_school_count = School.count
    @done_school_count = School.where(:done_flg => "t").count('id')
    @schools = School.all

    respond_to do |format|
      format.html
      format.csv { send_data School.to_csv, type: 'text/csv; charset=shift_jis', filename: "school.csv" }
    end
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = School.new
    10.times {@school.branches.build}
  end

  # GET /schools/1/edit
  def edit
    (10 - @school.branches.count).times {@school.branches.build}
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: '学校を新規登録しました。' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    #render :text => "#{school_params}"
    respond_to do |format|
      if @school.update(school_params)
        @next_school = School.where(:done_flg => false).order(:id).limit(1).first
        if @next_school
          format.html { redirect_to edit_school_path(@next_school), notice: '学校・学部情報を更新しました。次の学校を表示します。' }
          format.json { render :show, status: :ok, location: @next_school }
        else
          format.html { redirect_to schools_path, notice: '学校・学部情報を更新しました。次の学校はありません。' }
          format.json { render :show, status: :ok, location: @school }
        end
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def next
    @next_school = School.where(:done_flg => false).order(:id).limit(1).first
    if @next_school
      redirect_to edit_school_path(@next_school)
    else
      redirect_to schools_path, notice: '確認が必要な学校はありません。'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, :url, :done_flg, branches_attributes: [:id, :name, :url, :subject1, :subject2, :subject3, :subject4, :subject5, :subject6, :subject7, :subject8, :subject9, :subject10, :subject11, :subject12, :subject13, :subject14, :subject15, :subject16, :subject17, :subject18, :subject19, :subject20, :school_id, :_destroy])
    end
end
