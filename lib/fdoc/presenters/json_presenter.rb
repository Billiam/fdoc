require 'erb'
require 'json'
require 'coderay'

class Fdoc::JsonPresenter
  attr_reader :json

  def initialize(json)
    @json = json
  end

  def to_html
    if json.kind_of? String
      '<tt>&quot;%s&quot;</tt>' % json.gsub(/\"/, 'quot;')
    elsif json.kind_of?(Numeric) ||
          json.kind_of?(TrueClass) ||
          json.kind_of?(FalseClass)
      '<tt>%s</tt>' % json
    elsif json.kind_of?(Hash) ||
          json.kind_of?(Array)
      '<div class="CodeRay"><pre>%s</pre></div>' % CodeRay.scan(JSON.pretty_generate(json), :json).div(wrap: nil, css: :class)
    end
  end

  def to_markdown
    if json.kind_of?(Hash) ||
       json.kind_of?(Array)
      JSON.pretty_generate(json)
    else
      json
    end
  end
end
