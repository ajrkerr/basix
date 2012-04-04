class PasswordInput < Formtastic::Inputs::PasswordInput
  def input_html_options
    super.merge({
      :required => required?
    })
  end
end
