class CurrencyInput < NumberInput
  def input_html_options
    super.tap do |hsh|
      hsh[:data] = { :widgetclass => 'CurrencyInput' }
      hsh[:type] = "text"
    end
  end
end
