require 'spec_helper'

describe Slack::Client do
  context 'auth_test' do
    use_vcr_cassette 'auth_test'
    subject do
      Slack::Client.new.auth_test
    end
    it 'returns auth test data' do
      expect(subject['url']).to eq 'https://pingpong.slack.com/'
      expect(subject['team']).to eq 'pingpong'
      expect(subject['user']).to eq 'gamebot'
      expect(subject['team_id']).to eq 'TDEADBEEF'
      expect(subject['user_id']).to eq 'UBAADFOOD'
    end
  end
end
