class SelectInput < Formtastic::Inputs::SelectInput
  def input_html_options
    super.tap do |hsh|
      hsh[:required] = required?
      hsh[:placeholder] = options[:placeholder]
      hsh[:placement] = options[:placement] if options[:placement]
    end
  end
end
