class DateInput < StringInput
  def input_html_options
    super.deep_merge({
      :data => { :widgetclass => 'DatePicker' },
      :placeholder => 'dd/mm/yy', 
      # :value => (options[:value] ? options[:value] : nil)
    })
  end
end
