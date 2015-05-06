require_relative './spec_helper'

RSpec.describe Slack::Client, :vcr do
  describe :auth do
    describe :test do
      it "with valid token" do
        expect(
          valid_client.auth_test
        ).to valid_response
      end

      it "with invalid token" do
        expect(
          invalid_client.auth_test
        ).to include({
          "ok" => false,
          "error" => "invalid_auth"
        })
      end
    end
  end
end
