require_relative './spec_helper'

RSpec.describe Slack::Client, :vcr do
  describe :api do
    describe :test do
      it "with valid token" do
        expect(
          valid_client.api_test
        ).to valid_response
      end

      it "with extra arguments" do
        extra = {
          "foo" => "bar",
          "hello" => "world"
        }
        expect(
          valid_client.api_test(extra)["args"]
        ).to include(extra)
      end
    end
  end
end
