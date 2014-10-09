class BuildsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    if Build.create(params[:build].permit(:ipa))
      redirect_to root_url
    else

    end
  end

  def index
    @builds = Build.all
  end

  def plist
    @build = Build.find_by_ipa_digest(params[:digest])
    render layout: false
  end

end
