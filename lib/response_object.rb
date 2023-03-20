require 'json'

class ResponseObject
  attr_accessor :body, :status, :success
  def initialize(htt_party_response)
    @status = htt_party_response.code
    if htt_party_response.code == 200
      @success = true
      @body = htt_party_response.parsed_response
      set_attributes!
    else
      @success = false
      @body = { code: response.code, error_message: response['message'], success: false }
    end
  end

  def response_attributes
    @body.keys
  end

  def set_attributes!
    response_attributes.each do |ra|
      self.instance_variable_set("@#{ra}", @body[ra])
      self.singleton_class.instance_eval { attr_accessor ra }
    end
  end
end
