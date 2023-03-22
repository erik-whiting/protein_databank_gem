require 'json'

class ResponseObject
  attr_accessor :body, :status, :success, :multiple_records, :records
  def initialize(htt_party_response)
    @status = htt_party_response.code
    if @status && @status == 200
      @success = true
      @body = htt_party_response.parsed_response
      if @body.class == Hash
        set_attributes_from_hash!
      elsif @body.class == Array
        set_attributes_from_array!
      end
    else
      @success = false
      @body = {
        code: htt_party_response['code'],
        error_message: htt_party_response['message'],
        success: false
      }
    end
  end

  def response_attributes
    return @body.keys unless @multiple_records
    nil
  end

  def set_attributes_from_hash!
    @records = nil
    @multiple_records = false
    response_attributes.each do |ra|
      if ra[0] == '$'
        # Some endpoints return attribtues that start with a dollar
        # sign, which is not allowed in a Ruby object attribute.
        ra = ra[1..]
      end
      self.instance_variable_set("@#{ra}", @body[ra])
      self.singleton_class.instance_eval { attr_accessor ra }
    end
  end

  def set_attributes_from_array!
    @records = []
    @multiple_records = true
    @body.each do |item|
      @records.push(item)
    end
  end
end
