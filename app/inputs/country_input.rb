class CountryInput < Formtastic::Inputs::CountryInput
  def input_html_options
    super.merge(
      :required => required?,
      :priority_countries => ["Canada", "United States"], 
      :default => "Canada"
    )
  end
end
