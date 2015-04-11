require 'spec_helper'
require 'rack/mock'

describe Rack::Secure::Referer do
  it 'has a version number' do
    expect(Rack::Secure::Referer::VERSION).not_to be nil
  end

  describe '#referer' do
    subject { request.referer }

    let(:request) do
      Rack::Request.new(Rack::MockRequest.env_for("http://example.com:8080/").merge(referer_env))
    end

    let(:referer_env) { { 'HTTP_REFERER' => referer } }

    context 'when referer is /' do
      let(:referer) { '/' }
      it { expect(request.referer).to eq nil }
      it { expect(request.env['HTTP_REFERER']).to eq nil }
    end

    context 'when referer is javascript:alert(1)' do
      let(:referer) { 'javascript:alert(1)' }
      it { expect(request.referer).to eq nil }
      it { expect(request.env['HTTP_REFERER']).to eq nil }
    end

    context 'when referer is http://example.net/' do
      let(:referer) { 'http://example.net' }
      it { expect(request.referer).to eq referer }
      it { expect(request.env['HTTP_REFERER']).to eq referer }
    end

    context 'when referer is https://example.net/' do
      let(:referer) { 'https://example.net' }
      it { expect(request.referer).to eq referer }
      it { expect(request.env['HTTP_REFERER']).to eq referer }
    end
  end
end
