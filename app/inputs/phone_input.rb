class PhoneInput < Formtastic::Inputs::PhoneInput
  def input_html_options
    super.merge({
      :required => required?,
      :data => {
        :widgetclass => 'PhoneInput'
      }
    })
  end
end
