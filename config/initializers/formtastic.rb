#Freedom Patching 
module Formtastic
  module Helpers
    module InputsHelper

      alias :_inputs :inputs

      #Force formtastic to not auto-insert an LI around 
      # a second fieldset block
      def inputs *args, &block
        @already_in_an_inputs_block = false
        self._inputs *args, &block
      end

    end
  end
end

module Formtastic 
  module Inputs
    module Base
      module Labelling
        def label_html_options
          # opts = options_for_label(options) # TODO
          opts = {}
          opts[:for] ||= input_html_options[:id]
          opts[:class] = [opts[:class]]
          opts[:class] << 'control-label'
          
          opts
        end
      end

      module Wrapping
        alias :_wrapper_html_options :wrapper_html_options

        def wrapper_html_options
          options[:wrapper_html] ||= {}
          options[:wrapper_html][:class] = Array(options[:wrapper_html][:class])
          options[:wrapper_html][:class] << "control-group"

          _wrapper_html_options
        end
      end
    end
  end
end

Formtastic::Helpers::FormHelper.default_form_class = 'formtastic form-horizontal'

# Formtastic::Helpers::InputsHelper.include InputsHelperOverride