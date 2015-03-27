class BuildsController < ApplicationController
  before_action :authenticate_user!, except: [:plist, :download]

  def index
    @builds = current_user.builds.order("id DESC")
  end

  def new
  end

  def create
    @build = current_user.builds.new
    @build.update_attributes(params[:build].permit(:ipa))
    @build.save

    respond_to do |format|
      format.json { render json: { id: @build.id } }
      format.html { redirect_to @build.app, notice: "Build Uploaded" }
    end
  end

  def download
    @build = Build.find_by_ipa_digest(params[:digest])
    render layout: "application"
  end

  def plist
    @build = Build.find_by_ipa_digest(params[:digest])
    render layout: false
  end

end
