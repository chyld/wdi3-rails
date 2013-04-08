module ApplicationHelper
  def intellinav
    if @auth.present?
      link_to(@auth.email, login_path, :method => :delete)
    else
      link_to('Login', login_path)
    end
  end
end
