require 'date'
require 'mail'

# Replace the 'x' with your own information
# If using gmail, make sure you use an application specific password
email = 'x'
user_name = 'x'
password = 'x'

def pluralize(n, singular, plural=nil)
    if n == 1
        "1 #{singular}"
    elsif plural
        "#{n} #{plural}"
    else
        "#{n} #{singular}s"
    end
end

days = (Date.parse('January 15, 2015') - Date.today).to_i

string = "#{pluralize(days, "more day", "more days")} till the next pretzel day"

options = { :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => email,
            :user_name            => user_name,
            :password             => password,
            :authentication       => 'plain',
            :enable_starttls_auto => true  }

Mail.defaults do
  delivery_method :smtp, options
end

Mail.deliver do
       to email
     from email
  subject string
     body '#pretzelday'
end