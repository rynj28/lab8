class CoursesController < ApplicationController
  before_action :set_section, only: %i[ show edit update destroy ]

  # GET /sections or /sections.json
  def index
    @courses = Courses.all.includes(:student)
  end

  # GET /sections/1 or /sections/1.json
  def show
   @courses = Courses.find(params[:id])
   @subject = @section.subject
   @teacher = @subject.teacher
   @students = @subject.students
  end

  # GET /sections/new
  def new
    @courses = Courses.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections or /sections.json
  def create
    @courses = Courses.new(section_params)

    respond_to do |format|
      if @courses.save
        format.html { redirect_to section_url(@courses), notice: "Section was successfully created." }
        format.json { render :show, status: :created, location: @courses }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @courses.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1 or /sections/1.json
  def update
    respond_to do |format|
      if @courses.update(section_params)
        format.html { redirect_to section_url(@courses), notice: "Courses was successfully updated." }
        format.json { render :show, status: :ok, location: @courses }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @courses.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1 or /sections/1.json
  def destroy
    @courses.destroy

    respond_to do |format|
      format.html { redirect_to sections_url, notice: "Courses was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courses
      @courses = Courses.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def courses_params
      params.require(:section).permit(:name, :student_id, :subject_id)
    end
end
