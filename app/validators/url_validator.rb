##
# Custom validator for HTTP URLs. Technique inspired by https://stackoverflow.com/a/7167988/1082414
class UrlValidator < ActiveModel::EachValidator

  ##
  # Checks whether a HTTP/HTTPS URL can be successfully parsed according to RFC2396/RFC1738
  #
  # Returns +true+ if valid, +false+ otherwise
  def url_valid?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end

  ##
  # Adds error to record if the validated attribute is not a valid URL
  def validate_each(record, attribute, value)
    if value.present? && !self.url_valid?(value)
      record.errors.add attribute, "must be a valid URL"
    end
  end
  
end