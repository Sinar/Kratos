require 'spec_helper'

describe '/parties', :type => :api do

  let (:user) { create :admin }

  before :each do
    @party = create :party_with_coalition
  end

  context 'GET /parties' do
    it 'as JSON' do
      get '/parties.json'
      last_response.body.should include_json @party.to_json(:methods => :coalition)
    end
  end

  context 'GET /parties/uuid' do
    it 'as JSON' do
      get '/parties/%s.json' % @party.uuid
      last_response.body.should eql @party.to_json(:methods => :coalition)
    end
  end

  context 'POST /parties' do
    it 'as JSON' do
      post '/parties.json?auth_token=%s' % user.authentication_token, build(:party, uuid: 'ASOT', name: 'A State of Trance').to_json(:except => :coalition)
      Party.where('name like ?', '%State%Trance%').count.should == 1
    end
  end

  context 'DELETE /parties/uuid' do
    it 'as JSON' do
      Party.where(name: @party.name).count.should == 1
      delete '/parties/%s.json?auth_token=%s' % [@party.uuid, user.authentication_token]
      Party.where(name: @party.name).count.should == 0
    end
  end

end
