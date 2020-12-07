# frozen_string_literal: true

module PagesHelper
  def flash_msgs
    message = []
    flash.each do |_err, msg|
      message << msg
    end
    message.join(';  ')
  end
end
