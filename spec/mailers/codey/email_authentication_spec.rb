require "rails_helper"

RSpec.describe Codey::EmailAuthenticationMailer, type: :mailer do
  describe "#notification_email" do
    let(:address) { "somebody@example.com" }
    let(:authentication) { Codey::EmailAuthentication.new(email: address) }
    let(:mail) { Codey::EmailAuthenticationMailer.with(authentication: authentication).notification_email }

    it "renders the headers" do
      expect(mail.subject).to eq("Verification code: #{authentication.code}")
      expect(mail.to).to eq(["somebody@example.com"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include(authentication.code)
    end
  end
end
