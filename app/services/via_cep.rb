require "net/http"

class ViaCep
  def self.fetch(zip)
    uri = URI("https://viacep.com.br/ws/#{zip}/json/")
    res = Net::HTTP.get_response(uri)
    raise "CEP error" unless res.is_a?(Net::HTTPSuccess)
    JSON.parse(res.body)
  end
end
