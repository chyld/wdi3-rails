module ApplicationHelper
  def login_helper
    links = ""

    if @auth.present?
      links += wrap(link_to(@auth.email, session_path(@auth), :method => :delete, :remote => true, :class => 'button tiny alert'))
    else
      links += wrap(link_to('Register', new_user_path, :remote => true, :class => 'button tiny'))
      links += wrap(link_to('Login', new_session_path, :remote => true, :class => 'button tiny success'))
    end

    links.html_safe
  end

  def customer_links
    links = ""

    if @auth.present? && !@auth.is_admin
      links += wrap(link_to('Search', search_flights_path, :class => 'button tiny'))
    end

    links.html_safe
  end

  def admin_links
    links = ""

    if @auth.present? && @auth.is_admin
      links += wrap(link_to('Airplanes', airplanes_path, :class => 'button tiny'))
      links += wrap(link_to('Flights', flights_path, :class => 'button tiny'))
    end

    links.html_safe
  end

  def wrap(link)
    "<li>#{link}</li>"
  end
end
