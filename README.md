# Terms Of Service Generator
Terms of service generator prototype algorithm

- The intention was to try to keep it as simpe and robust as possible.
- The main `Translator` class is made inspired via the Facade design pattern to serve as an abstraction for the injection of dynamic terms and services within an input string.
- The main `Translator` class uses `Clause` and `Section` under the hood to easily process them and turn them into a friendlier format where O(1) access time is possible when finding a clause or section via ID.
- The `Section` and `Clause` class follow the template method design pattern where they both inherit from the same base class that contains shared functionality

# How to Run Tests
Since this is just plain Ruby and not Rails any test can be run via the command `ruby filepath_test.rb`. e.g `translator_test.rb`, the most important are the `Translator` tests since that is the main class that does all the heavy lifting, so the easiest way would just be to navigate to `tests/generator/` directory via terminal and run the command `ruby translator_test.rb`
`
