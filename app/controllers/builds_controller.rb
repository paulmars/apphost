class BuildsController < ApplicationController
  before_action :authenticate_user!, except: [:plist, :download]
  layout "normal"

  def new
  end

  def create
    if Build.create(params[:build].permit(:ipa))
      redirect_to root_url
    else

    end
  end

  def index
    @builds = Build.order("id DESC")
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
