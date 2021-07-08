# Подключаем библиотеку для работы с протоколом HTTP. Позже в курсе вы узнаете
# о нем подробнее.
require 'net/http'
# Для работы на Ruby версии 3.0 и выше необходимо доставить gem addressable
# и подключить его, т.к. net/http в Ruby версии 3.0 и выше не поддерживает метод encode
require 'addressable'

# Метод, word_exits? проверяет, есть ли статья на Викисловаре с таким словом
def word_exists?(word)
  # Формируем адрес страницы для проверки и записываем в переменную url.
  url = Addressable::URI.encode("https://ru.wiktionary.org/wiki/#{word}")

  # Достаем содержимое страницы по указанному адресу и записываем в переменную
  # wiktionary_page. Обратите внимание, что мы меняем кодировку на utf-8, чтобы
  # мы могли корректно работать с русскими буквами.
  wiktionary_page = Net::HTTP.get(URI.parse(url)).force_encoding('UTF-8')

  # С помощью регулярного выражения проверяем, есть ли на странице текст о том,
  # что такого слова нет.
  if wiktionary_page =~ /текст на данной странице отсутствует/
    # Если статьи про слово нет, значит надо вернуть false, такого слова нет
    return false
  else
    # Если такой текст на странице не найдет, значит статья есть и слово можно
    # засчитывать. Возвращаем true.
    return true
  end
end

# Метод, который формирует строку-шаблон типа "с.ат"
def random_regexp_string
  # Берем несоклько реально существующих слогов (можете дописать свои)
  patterns = ['торф', 'скат', 'свал', 'крик', 'спир']

  # Выбираем произвольных слог (например, скат)
  pattern = patterns.sample

  # Выбираем произвольную букву в нем (например, с или т)
  letter = pattern.split('').sample

  # Заменяем все вхождения этой буквы на точку (например, .кат или ска.)
  return pattern.gsub(letter, '.')
end