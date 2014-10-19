class BuildsController < ApplicationController
  before_action :authenticate_user!, except: [:plist, :download]
  layout "normal"

  def new
  end

  def create
    @build = current_user.builds.new(params[:build].permit(:ipa))
    if @build.save
      redirect_to root_url
    else

    end
  end

  def index
    @builds = current_user.builds.order("id DESC")
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
