require_relative "choosing_genre"
require_relative "file_reader"
require_relative "result_printer"

genre = ChoosingGenre.new.choosing_a_genre

films = FileReader.new(genre)

result = ResultPrinter.new.printer(films)

#result.printer(films)