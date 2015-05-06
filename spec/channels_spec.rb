require_relative './spec_helper'

RSpec.describe Slack::Client, :vcr do
  describe :channels do
    describe :archive do
      it "without name" do
        expect{valid_client.channels_archive}.to raise_error ArgumentError
      end

      it "with name" do
        expect(
          valid_client.channels_archive(channel: test_channel_id)
        ).to include({
          "ok" => true
        })
      end
    end

    describe :history do
      it "without name" do
        expect{valid_client.channels_history}.to raise_error ArgumentError
      end

      it "with name" do
        expect(
          valid_client.channels_history(channel: test_channel_id)
        ).to include({
          "ok" => true
        })
      end
    end

    describe :info do
      it "without name" do
        expect{valid_client.channels_info}.to raise_error ArgumentError
      end

      it "with name" do
        expect(
          valid_client.channels_info(channel: test_channel_id)
        ).to include({
          "ok" => true
        })
      end
    end

    describe :create do
      it "without name" do
        expect{valid_client.channels_create}.to raise_error ArgumentError
      end

      it "with test_channel_name" do
        response = valid_client.channels_create name: test_channel_name

        expect(response).to include({ "ok" => true })
        expect(response["channel"]).to include({ "name" => test_channel_name })
      end

      it "with taken name" do
        response = valid_client.channels_create name: "general"

        expect(response).to include({
          "ok" => false,
          "error" => "name_taken"
        })
      end
    end

    describe :list do
      it "with valid token" do
        response = valid_client.channels_list

        expect(response).to include({ "ok" => true })
      end
    end

    describe :invite do
      it "without arguments" do
        expect{valid_client.channels_invite}.to raise_error ArgumentError
      end

      it "without argument(channel)" do
        expect{valid_client.channels_invite(user: test_user_id)}.to raise_error ArgumentError
      end

      it "without argument(user)" do
        expect{valid_client.channels_invite(channel: test_channel_id)}.to raise_error ArgumentError
      end

      it "with valid arguments" do
        expect(
          valid_client.channels_invite(user: another_user_id, channel: test_channel_id)
        ).to include({
          "ok" => true
        })
      end
    end

    describe :leave do
      it "without argument" do
        expect{valid_client.channels_leave}.to raise_error ArgumentError
      end

      it "with channel" do
        expect(
          valid_client.channels_leave(channel: test_channel_id)
        ).to include({
          "ok" => true
        })
      end
    end

    describe :join do
      it "without :name" do
        expect{valid_client.channels_join}.to raise_error ArgumentError
      end

      it "with :name" do
        expect(
          valid_client.channels_join(name: test_channel_name)
        ).to include({
          "ok" => true
        })
      end
    end

    describe :kick do
      it "without arguments" do
        expect{valid_client.channels_kick}.to raise_error ArgumentError
      end
      it "without :channel" do
        expect{valid_client.channels_kick(name: another_user_id)}.to raise_error ArgumentError
      end
      it "without :name" do
        expect{valid_client.channels_kick(channel: test_channel_id)}.to raise_error ArgumentError
      end
      it "with arguments" do
        expect(
          valid_client.channels_kick(user: another_user_id, channel: test_channel_id)
        ).to include({
          "ok" => true
        })
      end
    end

    describe :mark do
      it "without arguments" do
        expect{valid_client.channels_mark}.to raise_error ArgumentError
      end

      it "without ts" do
        expect{valid_client.channels_mark(channel: test_channel_id)}.to raise_error ArgumentError
      end

      it "without channel" do
        expect{valid_client.channels_mark(ts: 0)}.to raise_error ArgumentError
      end
      it "with argument" do
        expect(
          valid_client.channels_mark(channel: test_channel_id, ts: 0)
        ).to include({
          "ok" => true
        })
      end
    end

    describe :rename do
      it "without arguments" do
        expect{valid_client.channels_rename}.to raise_error ArgumentError
      end

      it "without channel" do
        expect{valid_client.channels_rename(name: another_channel_name)}.to raise_error ArgumentError
      end

      it "without name" do
        expect{valid_client.channels_rename(channel: test_channel_id)}.to raise_error ArgumentError
      end

      it "with name" do
        expect(
          valid_client.channels_rename(channel: test_channel_id, name: another_channel_name)
        ).to include({
          "ok" => true
        })
      end
    end

    describe :setPurpose do
      it "without arguments" do
        expect{valid_client.channels_setPurpose}.to raise_error ArgumentError
      end

      it "without channel" do
        expect{valid_client.channels_setPurpose(purpose: "TestPurpose")}.to raise_error ArgumentError
      end

      it "without topic" do
        expect{valid_client.channels_setPurpose(channel: test_channel_id)}.to raise_error ArgumentError
      end

      it "with arguments" do
        expect(
          valid_client.channels_setPurpose(channel: test_channel_id, purpose: "TestPurpose")
        ).to include({
          "ok" => true
        })
      end
    end

    describe :setTopic do
      it "without arguments" do
        expect{valid_client.channels_setTopic}.to raise_error ArgumentError
      end

      it "without channel" do
        expect{valid_client.channels_setTopic(topic: "TestTopic")}.to raise_error ArgumentError
      end

      it "without topic" do
        expect{valid_client.channels_setTopic(channel: test_channel_id)}.to raise_error ArgumentError
      end

      it "with arguments" do
        expect(
          valid_client.channels_setTopic(channel: test_channel_id, topic: "TestTopic")
        ).to include({
          "ok" => true
        })
      end
    end

    describe :unarchive do
      it "without :channel" do
        expect{valid_client.channels_join}.to raise_error ArgumentError
      end

      it "with :channel" do
        expect(
          valid_client.channels_unarchive(channel: test_channel_id)
        ).to include({
          "ok" => true
        })
      end
    end
  end
end
