require '../../../src/generator/tags/clause.rb'
require '../../../src/generator/tags/section.rb'

def required_attribute_test
  ans = :clauses_ids
  output = Generator::Tags::Section.required_attribute

  puts "Expected Output: #{ans}"
  puts "Actual Output: #{output}"
  puts (ans == output ? 'Passed' : 'Failed')
end

def translate_test(id, clauses, sections)
  ans = 'The quick brown fox;jumps over the lazy dog'
  clauses = Generator::Tags::Clause.generate(clauses)
  sections = Generator::Tags::Section.generate(sections)
  output = Generator::Tags::Section.translate(id, clauses, sections)

  puts "Expected Output: #{ans}"
  puts "Actual Output: #{output}"
  puts (ans == output ? 'Passed' : 'Failed')
end

def generate_test(sections)
  ans = {
    1 => [1, 2],
    2 => [1, 3, 4]
  }
  output = Generator::Tags::Section.generate(sections)

  puts "Expected Output: #{ans}"
  puts "Actual Output: #{output}"
  puts (ans == output ? 'Passed' : 'Failed')
end

clauses = [
  { "id": 1, "text": 'The quick brown fox' },
  { "id": 2, "text": 'jumps over the lazy dog' },
  { "id": 3, "text": 'And dies' },
  { "id": 4, "text": 'The white horse is white' }
]

sections = [
  { "id": 1, "clauses_ids": [1, 2] },
  { "id": 2, "clauses_ids": [1, 3, 4] }
]

puts "Clause class required attribute test #{required_attribute_test}"
puts "Clause class translate test #{translate_test(1, clauses, sections)}"
puts "Clause class generate test #{generate_test(sections)}"
