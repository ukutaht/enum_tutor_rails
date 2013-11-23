class Admin::ChallengesController < Admin::BaseController

  def index
    @challenges = Challenge.all
  end

  def new
    @challenge = Challenge.new
    @challenge.doc = Doc.new
    render 'form'
  end

  def create
    @challenge = Challenge.new(params[:challenge])
    @challenge.doc = Doc.create(params[:doc])

    if @challenge.save && @challenge.doc.save
      redirect_to admin_challenges_path
    else
      render 'form'
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
    render 'form'
  end

  def update

  end
end
