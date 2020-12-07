# frozen_string_literal: true

module RecentworksHelper
  def add_portfolio_items
    if logged_in?(:site_admin)
      link_to 'Create new portfolio item >', new_recentwork_path, class: 'new_item'
    end
  end

  def edit_item(item)
    if logged_in?(:site_admin)
      link_to 'Edit', edit_recentwork_path(item), class: 'links__container mt-5 links__text'
    end
  end

  def delete_item(item); end
end
