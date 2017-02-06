module RailsAdmin
  module Code
    module Box
      class Type < RailsAdmin::Config::Fields::Base
        RailsAdmin::Config::Fields::Types::register(:code_box, self)


        register_instance_option :partial do
          :form_enumeration
        end

        register_instance_option :multiple? do
          true
        end

        register_instance_option :enum_method do
          @enum_method ||= bindings[:object].class.respond_to?("#{name}_code") || bindings[:object].respond_to?("#{name}_code") ? "#{name}_code" : name
        end

        register_instance_option :enum do
          code_box
        end
        register_instance_option :code_box do
          bindings[:object].class.respond_to?(enum_method) ? bindings[:object].class.send(enum_method) : bindings[:object].send(enum_method)
        end

        register_instance_option :formatted_value do
          bindings[:object].send(name).map { |e| e.code  }
        end

        register_instance_option :pretty_value do
          if enum.is_a?(::Hash)
            enum.reject { |_k, v| v.to_s != value.to_s }.keys.first.to_s.presence || value.presence || ' - '
          elsif enum.is_a?(::Array) && enum.first.is_a?(::Array)
            enum.detect { |e| e[1].to_s == value.to_s }.try(:first).to_s.presence || value.presence || ' - '
          else
            value.presence || ' - '
          end
        end
      end
    end
  end
end
