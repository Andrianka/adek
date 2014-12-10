class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    menu_access_abilities(user)
  end

  def menu_access_abilities(user)
    if user.admin?
      can :manage, :all
      can :access, [:action_order, :action_user, :action_shop, :action_warehouse, :action_order_item, :action_product, :menu_order, :menu_product, :menu_warehouse, :menu_client]
    elsif user.owner?
      can :manage, :all
      can :access, [:action_order, :action_user, :action_shop, :action_warehouse, :action_order_item, :action_product, :menu_order, :menu_product, :menu_warehouse, :menu_client]
    else
      can :read, :all
      cannot :access, [:action_shop, :action_warehouse, :action_order_item, :menu_order, :menu_product, :menu_warehouse, :menu_client]
    end
  end    
end
