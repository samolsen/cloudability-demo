class ActionView::Helpers::FormBuilder
  
  def gender_select(method, options={ :include_blank => true }, html_options={})
    @template.select(@object_name, method, Gender::ALL.map { |g| [g.capitalize, g] } ,objectify_options(options), @default_options.merge(html_options))
  end
  
end