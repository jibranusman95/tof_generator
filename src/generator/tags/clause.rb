require_relative './base.rb'

module Generator
  module Tags
    class Clause < Generator::Tags::Base
      class << self
        def translate(id, clauses, _sections)
          clauses[id.to_i]
        end

        def required_attribute
          :text
        end
      end
    end
  end
end
