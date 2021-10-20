# Подключаем методы городов из соответствующих файлов. Обратите внимание, что мы
# используем для этого не require, а require_relative. В отличие от require этот
# метод ищет файлы .rb (расширение можно не указывать) в той же папке, где лежит
# сама программа.
require_relative "paris"
require_relative "rome"
require_relative "london"

visit_paris
visit_london
visit_rome