module ApplicationHelper
  def login_nav
    if @auth.present?
      link_to(@auth.email, login_path, :method => :delete, :class => 'button alert')
    else
      link_to('Login', login_path, :class => 'button success')
    end
  end
end
