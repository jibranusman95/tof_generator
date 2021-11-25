require_relative './tags/section.rb'
require_relative './tags/clause.rb'

module Generator
  class Translator
    TRANSLATION_REGEX = /((\[[^\]]+\]))+/
    TAG_TYPES = {
      'CLAUSE' => Tags::Clause,
      'SECTION' => Tags::Section
    }

    attr_reader :clauses, :sections

    def initialize(clauses, sections)
      @clauses = Tags::Clause.generate(clauses)
      @sections = Tags::Section.generate(sections)
    end

    def translate(str)
      str.gsub(TRANSLATION_REGEX) do |tag|
        tag_type, id = tag[1..-2].split('-')
        tag_generator = TAG_TYPES[tag_type]

        tag_generator.translate(id, clauses, sections) if tag_generator != nil
      end
    end
  end
end
