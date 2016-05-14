class CreateAchievement
  attr_reader :achievement
  def initialize(params, user)
    @params = params
    @user = user
    @achievement = Achievement.new(achievement_params)
    @achievement.user = @user
    @status = false
  end

  def create
    if @achievement.save
      @status = true
    end
  end

  def created?
    @status
  end

  private

  def achievement_params
    @params.permit(:title, :description, :privacy, :cover_image, :featured)
  end

end