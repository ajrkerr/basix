class EmailInput < StringInput
  def input_html_options
    super.merge({
      :regExp => '[\w-.]+@([\w-]+\.)+[\w-]+',
    })
  end
end
