require '../../src/generator/translator.rb'

def single_on_line_test(generator)
  input_str = <<-STR
    A T&C Document
    This document is made of plaintext. Is made of [CLAUSE-3].
    Is made of [CLAUSE-4].
    Is made of [SECTION-1].
    Your legals.
  STR

  ans = <<-STR
    A T&C Document
    This document is made of plaintext. Is made of And dies.
    Is made of The white horse is white.
    Is made of The quick brown fox;jumps over the lazy dog.
    Your legals.
  STR

  output = generator.translate(input_str)

  puts "Input: #{input_str}"
  puts "Expected Output: #{ans}"
  puts "Actual Output: #{output}"
  puts (output == ans ? 'Passed' : 'Failed')
end

def multiple_on_line_test(generator)
  input_str = <<-STR
    A T&C Document
    This document is made of plaintext. Is made of [CLAUSE-1] [CLAUSE-3].
    Is made of [SECTION-2].
    Is made of [SECTION-1] [SECTION-2].
    Your legals.
  STR

  ans = <<-STR
    A T&C Document
    This document is made of plaintext. Is made of The quick brown fox And dies.
    Is made of The quick brown fox;And dies;The white horse is white.
    Is made of The quick brown fox;jumps over the lazy dog The quick brown fox;And dies;The white horse is white.
    Your legals.
  STR

  output = generator.translate(input_str)

  puts "Input: #{input_str}"
  puts "Expected Output: #{ans}"
  puts "Actual Output: #{output}"
  puts (output == ans ? 'Passed' : 'Failed')
end

def unkown_keywords_test(generator)
  input_str = <<-STR
    A T&C Document
    This document is made of plaintext. Is made of [CLAUPE-3].
    Is made of [CLAUSP-4].
    Is made of [SECTIPN-1].
    Your legals.
  STR

  ans = <<-STR
    A T&C Document
    This document is made of plaintext. Is made of .
    Is made of .
    Is made of .
    Your legals.
  STR

  output = generator.translate(input_str)

  puts "Input: #{input_str}"
  puts "Expected Output: #{ans}"
  puts "Actual Output: #{output}"
  puts (output == ans ? 'Passed' : 'Failed')
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

generator = Generator::Translator.new(clauses, sections)

puts "Single on one line test:\n#{single_on_line_test(generator)}\n\n\n"
puts "Multiple on one line test:\n#{multiple_on_line_test(generator)}\n\n\n"
puts "Unknown keywords test:\n#{unkown_keywords_test(generator)}\n\n\n"
