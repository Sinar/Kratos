# See: [How do we include support helpers in request specs?](http://www.ruby-forum.com/topic/2782811)
# See: [The Rails 3 in Action project, on Rails 3.1](http://github.com/rails3book/ticketee/blob/master/spec/api)
module ApiHelper

  include Rack::Test::Methods

  def app
    Rails.application
  end

end

RSpec.configure do |c|
  c.include ApiHelper, :type => :api
end
