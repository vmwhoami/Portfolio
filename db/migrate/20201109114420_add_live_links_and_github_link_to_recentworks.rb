# frozen_string_literal: true

class AddLiveLinksAndGithubLinkToRecentworks < ActiveRecord::Migration[6.0]
  def change
    add_column :recentworks, :github_link, :text
    add_column :recentworks, :live_link, :text
  end
end
