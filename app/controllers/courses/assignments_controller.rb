class Courses::AssignmentsController < ApplicationController
  before_filter :find_course
  before_filter :students_and_instructors_only
  
  def show
    @assignment = @course.assignments.find(params[:id])
  end
  
  private
  
  def find_course
    @course = Course.find(params[:course_id])
  end
  
  private
  
  def students_and_instructors_only
    if !@course.students.include?(current_user) and
       !@course.instructors.include?(current_user)
      
      flash[:notice] = "You are not enrolled in this course!"
      redirect_to courses_path
    end
  end
end
