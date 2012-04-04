class BooleanInput < Formtastic::Inputs::BooleanInput
  def input_html_options
    super.merge({
      :required => required?
    })
  end

  def to_html
    input_wrapping do
      hidden_field_html <<
      builder.label(method, label_text, label_html_options) <<
      check_box_html
    end
  end
end
