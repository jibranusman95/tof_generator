require_relative './base.rb'

module Generator
  module Tags
    class Section < Generator::Tags::Base
      class << self
        def translate(id, clauses, sections)
          section = sections[id.to_i]
          return if section == nil

          section.map { |clause_id| clauses[clause_id] }.join(';')
        end

        def required_attribute
          :clauses_ids
        end
      end
    end
  end
end
