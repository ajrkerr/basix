class StringInput < Formtastic::Inputs::StringInput
  def input_html_options
    super.tap do |hsh|
      hsh[:required] = required?
      hsh[:placement] = options[:placement] if options[:placement]
    end
  end
end
