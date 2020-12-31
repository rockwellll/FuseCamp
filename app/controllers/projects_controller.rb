class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :show]
  before_action :owner?, only: [:edit, :show, :edit]


  def new
    @project = Project.new
  end

  def index

  end

  def create
    @project = current_user.projects.new project_params

    respond_to do |format|
      if @project.save
        format.html { redirect_to user_projects_path(user_id: current_user), notice: 'Project successfully created.' }
        format.json { render :show, status: :created, location: @t1 }
      else
        format.html { render :new }
        format.json { render json: @t1.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def show

  end

  private
  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find params[:id]
  end

  def owner?
     current_user.id == Project.find(params[:id]).user_id
  end
end
