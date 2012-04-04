class PostalInput < Formtastic::Inputs::StringInput
  def input_html_options
    super.merge({
      :required => required?,
      :data => {
        :widgetclass => 'PostalInput'
      }
    })
  end
end