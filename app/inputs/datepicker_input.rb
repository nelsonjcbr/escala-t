class DatepickerInput < SimpleForm::Inputs::TextInput
  def input(wrapper_options)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    merged_input_options["data-options"] = '{"enableTime":true,"dateFormat":"d/m/Y","disableMobile":true,"allowInput":true}'
    "#{@builder.text_field(attribute_name, merged_input_options)}".html_safe
  end
end