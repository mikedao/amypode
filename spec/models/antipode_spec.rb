require 'rails_helper'

describe Antipode do
  it "exists" do
    antipode = Antipode.new("27","-82")
    expect(antipode).to be_a(Antipode)
  end

  it "can calculate lat and long" do
    antipode = Antipode.new("27","-82")

    expect(antipode.lat).to eq(-27)
    expect(antipode.long).to eq(98)
  end

  it "can calculate other lat and long" do
    antipode = Antipode.new("27","82")

    expect(antipode.lat).to eq(-27)
    expect(antipode.long).to eq(-98)
  end
end
