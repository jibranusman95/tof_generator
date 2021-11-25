module Generator
  module Tags
    class Base
      protected

      class << self
        def generate(tags)
          tags_hash = {}
          tags.each do |tag|
            tags_hash[tag[:id]] = tag[self.required_attribute]
          end

          tags_hash
        end

        def required_attribute
          raise NotImplementedError
        end
      end
    end
  end
end
