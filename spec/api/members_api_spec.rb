require 'spec_helper'

# See: https://github.com/rails3book/ticketee/blob/master/spec/api/v1/tickets_spec.rb
describe '/members', :type => :api do

  # Lazy, not suitable for API test. Use before(:each|:all) instead.
  # The object is not initialized until its first method is accessed.
  # let (:member) { create(:member) }

  # If we use before :all, we will have to tear down manually.
  # See: http://stackoverflow.com/a/3335856/36397
  let (:user) { create :admin }

  before :each do
    @member = create :member_with_party
  end

  context 'GET /members' do
    it 'as JSON' do
      get '/members.json'
      last_response.body.should include_json @member.to_json(:methods => :party)
    end
  end

  context 'GET /members/uuid' do
    it 'as JSON' do
      get '/members/%s.json' % @member.uuid
      last_response.body.should eql @member.to_json(:methods => :party)
    end
  end

  context 'POST /members' do
    it 'as JSON' do
      post '/members.json?auth_token=%s' % user.authentication_token, build(:member, name: 'Katie Fey').to_json(:except => 'party')
      Member.where('name like ?', 'Katie%').count.should == 1
    end
  end

  context 'DELETE /members/uuid' do
    it 'as JSON' do
      Member.where(name: @member.name).count.should == 1
      delete '/members/%s.json?auth_token=%s' % [@member.uuid, user.authentication_token]
      Member.where(name: @member.name).count.should == 0
    end
  end
end
