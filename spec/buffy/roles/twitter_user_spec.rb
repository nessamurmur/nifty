require 'spec_helper'

RSpec.describe Nifty::TwitterUser do
  subject { OpenStruct.new.extend(described_class) }

  describe "#build_client" do
    let(:secret) { generate(:string, limit: 40) }
    let(:token) { generate(:string, limit: 40) }

    it "builds a client" do
      expect(subject.build_client(token, secret)).to eq subject.client
    end

    it "accepts an alternative client class with the same interface" do
      expect(subject.build_client(token, secret, Twitter::Streaming::Client))
    end

    generative do
      for_every(:secret) { generate(:string, limit: 40) }
      for_every(:token) { generate(:string, limit: 40) }

      it "builds the client with the secret given" do
        expect(subject.build_client(token, secret).access_token).to eq token
      end

      it "builds the client with the token given" do
        expect(subject.build_client(token, secret).access_token_secret)
          .to eq secret
      end
    end
  end
end
