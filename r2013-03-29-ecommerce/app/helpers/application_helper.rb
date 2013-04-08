module ApplicationHelper
  def login_helper
    if @auth.present?
      link_to(@auth.email, login_path, :method => :delete, :remote => true, :class => 'button tiny alert')
    else
      link_to('Login', login_path, :remote => true, :class => 'button tiny success')
    end
  end
end
