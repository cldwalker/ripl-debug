module Ripl
  module Debug
    def before_loop
      super
      require 'ruby-debug'
      Debugger.run_init_script(StringIO.new)
    end

    def loop_eval(input)
      if config[:debug]
        # move local variables outside of with_post_mortem
        input = (set_var_string = input.to_s[/^\s*\w+\s*=\s+/]) ?
          "#{set_var_string} with_post_mortem { #{input.sub(set_var_string, '')} }" :
          "with_post_mortem { #{input} }"
      end
      super(input)
    end

    module Commands
      # from http://simple-and-basic.com/2009/02/catching-and-examining-exceptions-in-a-irb-session.html
      def with_post_mortem
        Debugger.start
        result = nil
        Debugger.post_mortem do 
          result = yield
        end
        Debugger.stop
        result
      end
    end
  end
end

Ripl::Shell.send :include, Ripl::Debug
Ripl::Commands.send :include, Ripl::Debug::Commands
Ripl.config[:debug] = true
