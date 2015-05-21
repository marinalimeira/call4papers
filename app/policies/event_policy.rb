class EventPolicy
  attr_reader :user, :event

  def initialize(user, event)
    @user = user
    @event = event
  end

  def index?
    true
  end

  def show?
    true
  end

  def update?
    @event.user_id == @user.id
  end

  def destroy
    @event.user_id == @user.id
  end
end

