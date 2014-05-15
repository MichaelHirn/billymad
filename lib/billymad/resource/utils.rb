module Billymad
  module Resource
    module Utils

      def demodulize(path)
        path = path.to_s
        if i = path.rindex('::')
          path[(i+2)..-1]
        else
          path
        end
      end

    end
  end
end