require_relative './spec_helper'

RSpec.describe Slack::RealTime::Client, vcr: { cassette_name: 'rtm.start' } do
  let(:mock_socket) { double(Faye::WebSocket::Client, on: true) }
  before do
    allow(EM).to receive(:run).and_yield
    allow(EM).to receive(:next_tick).and_yield
  end
  subject do
    valid_client.realtime
  end
  it 'is not started by default' do
    expect(subject.url).to eq 'wss://ms173.slack-msgs.com/websocket/xyz'
    expect(subject).to_not be_started
  end
  describe 'started' do
    before do
      expect(Faye::WebSocket::Client).to receive(:new).and_return(mock_socket)
      subject.start
    end
    it 'connects websocket' do
      expect(subject).to be_started
      expect(subject.url).to eq 'wss://ms173.slack-msgs.com/websocket/xyz'
    end
    describe 'send_data' do
      it 'sends raw data' do
        data = 'raw data'
        expect(mock_socket).to receive(:send).with(data)
        subject.send_data(data)
      end
    end
  end
end
