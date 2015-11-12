class ProjectsController < ApplicationController
  def index
    @projects = Project.all  
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.create(project_params)
    
    if (@project.invalid? || @project.nil?)
      return render :text => "Something went wrong", :status => :unprocessable_entity
    end
    
    redirect_to projects_path
  end
  
  private
  
  def project_params
    params.require(:project).permit(:name, :description, :url)
  end
  
  
end
