module ApplicationHelper
  def login_nav
    nav = ""

    if @subscriber.present? && @subscriber.has_subscription?
      nav += "<li>#{link_to('Profile', '#', :class => 'button tiny success')}</li>"
    end

    if @auth.present?
      nav += "<li>#{link_to(@auth.username, '/login', :method => :delete, :remote => true, :class => 'button tiny alert')}</li>"
    end

    nav
  end
end
