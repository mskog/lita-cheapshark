module Lita
  module Handlers
    class Cheapshark < Handler
      CHEAPSHARK_URL = "http://www.cheapshark.com/api/1.0"
      CHEAPSHARK_DEAL_URL = "http://www.cheapshark.com/redirect"

      route(/^(?:cheapshark)\s+(.*)/i, :cheapshark, command: true, help: { t("help.cheapshark_key") => t("help.cheapshark_value")})

      def cheapshark(response)
        term = response.matches[0][0]
        data = connection.get("games", title: term).body
        response.reply("No deal found for '#{term}'") && return if data.size == 0
        deal = data.first
        response.reply("Cheapest deal for '#{deal['external']}': $#{deal['cheapest']}")
        response.reply("#{CHEAPSHARK_DEAL_URL}?dealID=#{deal['cheapestDealID']}")
      end

      private

      def connection
        Faraday.new CHEAPSHARK_URL
      end

      Lita.register_handler(self)
    end
  end
end
