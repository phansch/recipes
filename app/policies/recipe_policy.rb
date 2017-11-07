# frozen_string_literal: true

class RecipePolicy
  attr_reader :user, :recipe

  def initialize(user, recipe)
    @user = user
    @recipe = recipe
  end

  def show?
    true
  end

  def index?
    true
  end

  def new?
    user
  end

  def create?
    user
  end

  def edit?
    user&.admin? || recipe.owner?(user)
  end

  def update?
    user&.admin? || recipe.owner?(user)
  end

  def destroy?
    user&.admin? || recipe.owner?(user)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
end
