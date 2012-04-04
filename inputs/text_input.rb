class TextInput < Formtastic::Inputs::TextInput
  def input_html_options
    super.tap do |hsh|
      hsh[:required] = required?
      hsh[:data] = { :widgetclass => 'TextArea' }
      hsh[:placeholder] = options[:placeholder]
      hsh[:placement] = options[:placement] if options[:placement]
    end
  end
end
