require 'spec_helper'

# See: https://github.com/rails3book/ticketee/blob/master/spec/api/v1/tickets_spec.rb
describe '/members', :type => :api do

  # Lazy, not suitable for API test. Use before(:each|:all) instead.
  # let (:member) { create(:member) }

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
      post '/members.json', build(:member, name: 'Katie Fey').to_json(:except => 'party')
      Member.where('name like ?', 'Katie%').count.should == 1
      # TODO [yclian 20120314] Add party membership for this member.
    end
  end

  context 'DELETE /members/uuid' do
    it 'as JSON' do
      Member.where(name: @member.name).count.should == 1
      delete '/members/%s.json' % @member.uuid
      Member.where(name: @member.name).count.should == 0
    end
  end
end
