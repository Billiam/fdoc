class Fdoc::HeaderPresenter
  attr_reader :header

  def initialize(header)
    @header = header
  end

  def to_html
    if header.kind_of?(Hash) ||
          header.kind_of?(Array)
      '<div class="code-section example-headers"><pre>%s</pre></div>' % header_text
    end
  end

  def to_markdown
    if header.kind_of?(Hash) ||
       header.kind_of?(Array)
      header_text
    end
  end

  protected

  def header_text
    header.map {|key, value| "#{key}: #{value}" }.join("\n")
  end
end
