# frozen_string_literal: true

class ProjectsController < ApiController
  before_action :authenticate_user!

  load_and_authorize_resource

  def index
    render_resources(current_user.projects, each_serializer: ProjectSerializer)
  end

  def create
    @project.save
    render_resource_or_errors(@project, serializer: ProjectSerializer)
  end

  def update
    @project.update(project_params)
    render_resource_or_errors(@project, serializer: ProjectSerializer)
  end

  def destroy
    @project.destroy
    render_resource_or_errors(@project, serializer: ProjectSerializer)
  end

  private

  def project_params
    params.require(:resource).permit(:name)
  end
end
