module ApplicationHelper
    # criado um helper para retirar o turbolinks/hotwired do formulario,
    # estava perdendo os retornos (mensagem de validações, flash[] etc..)
    def simple_form_sh(object, *args, &block)
        options = args.extract_options!
        options.merge!(data: {turbo: false})
        simple_form_for(object, *(args << options), &block)
    end

    def simple_fields_for_padrao(model, form_obj, view_path, args = {})
        render partial: 'shared/simple_fields_for_padrao',
         locals: {model: CadpadraoItem, f: form_obj, view_path: view_path, add_fields_b: args[:add_fields_b] || true}    
    end

    def link_to_add_fields(name, f, association, spasta = "", options = {})
        new_object = f.object.class.reflect_on_association(association).klass.new
        fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
            if spasta.to_s == ""
                render(association.to_s.singularize + "_fields", :f => builder)
            else
            # Qdo for partial com pastas diferentes tem que indicar o diretorio
                render(spasta.to_s+'/'+association.to_s.singularize + "_fields", :f => builder)
            end
        end

        options[:onclick] = "event.preventDefault(); add_fields(this, '#{association}', '#{escape_javascript(fields)}')"
        # link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
        link_to(name, '#', options).html_safe
    end

    def sanitized_object_name(object_name)
        object_name.gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
    end

    def sanitized_method_name(method_name)
        method_name.sub(/\?$/,"")
    end

    def form_tag_id(object_name, method_name)
        "#{sanitized_object_name(object_name.to_s)}_#{sanitized_method_name(method_name.to_s)}"
    end

    def link_to_remove_fields(name, f, title = nil)
        f.hidden_field(:_destroy).html_safe + link_to(name, '#', onclick: "event.preventDefault(); remove_fields(this)",
            :title => title, :tabindex => "-1", :class => "remove_fields btn-i-excluir").html_safe
    end

    # Usado no CRUD inline
    def errors_for(model, key)
      tag.div(class: "mt-2 form-error") do
        model.errors.messages_for(key).join(", ")
      end
    end
    
end
