ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base, :access_key_id => ENV['AWSKEY'], :secret_access_key => ENV['AWSSEC']
