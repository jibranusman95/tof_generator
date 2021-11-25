require '../../../src/generator/tags/clause.rb'

def required_attribute_test
  ans = :text
  output = Generator::Tags::Clause.required_attribute

  puts "Expected Output: #{ans}"
  puts "Actual Output: #{output}"
  puts (ans == output ? 'Passed' : 'Failed')
end

def translate_test(id, clauses, sections)
  ans = 'The quick brown fox'
  clauses = Generator::Tags::Clause.generate(clauses)
  output = Generator::Tags::Clause.translate(id, clauses, sections)

  puts "Expected Output: #{ans}"
  puts "Actual Output: #{output}"
  puts (ans == output ? 'Passed' : 'Failed')
end

def generate_test(clauses)
  ans = {
    1 => 'The quick brown fox',
    2 => 'jumps over the lazy dog',
    3 => 'And dies',
    4 => 'The white horse is white'
  }
  output = Generator::Tags::Clause.generate(clauses)

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
puts "Clause class generate test #{generate_test(clauses)}"
