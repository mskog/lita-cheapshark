require "spec_helper"

describe Lita::Handlers::Cheapshark, lita_handler: true do
  it { is_expected.to route_command("cheapshark batman: arkham city").to(:cheapshark) }

  describe "#cheapshark" do
    context "with a term with results" do
      before :each do
        stub_request(:get, "#{described_class::CHEAPSHARK_URL}/games").with(query: {title: 'batman: arkham city'}).to_return(body: JSON.parse(File.read('spec/fixtures/games_batman_arkham_city.json')))
      end

      it "returns the title of the game, the best deal as well as a url to the deal" do
        send_command "cheapshark batman: arkham city"
        expect(replies.count).to eq 2
        expect(replies[0]).to match "Cheapest deal for 'Batman: Arkham City': $19.99"
        expect(replies[1]).to match "http://www.cheapshark.com/redirect?dealID=se5gAdztkrc9svaLPhaVb1drhQP3tlcztIhqLh7cTA0%3D"
      end
    end

    context "with a term without results" do
      before :each do
        stub_request(:get, "#{described_class::CHEAPSHARK_URL}/games").with(query: {title: 'foobar'}).to_return(body: [])
      end

      it "returns a helpful message" do
        send_command "cheapshark foobar"
        expect(replies.count).to eq 1
        expect(replies[0]).to match "No deal found for 'foobar'"
      end
    end
  end
end
