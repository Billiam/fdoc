class Fdoc::Node

  attr_reader :raw

  def initialize(data)
    @raw = data
    assert_required_keys
  end

  def self.required_keys(*args)
    @required_keys ||= []
    return @required_keys if args.empty?
    (@required_keys << args).flatten!
  end

  def assert_required_keys
    self.class.required_keys.each do |key|
      raise Fdoc::MissingAttributeError, "Required key not present: #{key}" if raw[key] == nil
    end
  end
end