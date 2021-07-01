questions = [
  "Если ваш партнер бросает взгляд на незнакомую женщину, вы устраиваете ему скандал прямо на улице?",
  "Если ваш партнер опаздывает на ужин, вы уверены, что он был с другой?",
  "Вы расспрашиваете его о работе, о коллегах?",
  "Вы считаете, что каждую свободную минуту должны проводить вместе?",
  "Он для вас — свет в окошке?",
  "Случается ли вам проверять его корреспонденцию и рыться в его вещах?",
  "Чем чаще он говорит о своих чувствах, тем меньше вы верите?",
  "Вы хотите, чтобы он интересовался только тем, чем интересуетесь вы?",
  "Вы всегда спрашиваете у него, куда он ходит и с кем встречается?",
  "Если вы на него обижены, то молчите по нескольку дней?",
  "Вас мучают мысли о его бывшей возлюбленной?",
  "Он утверждает, что не ревнует вас, потому что доверяет. Для вас это означает, что любовь прошла?"
]

results = [
# 10 и более ответов «да»
"Вы болезненно ревнивы. Не думайте, что если избранник вас любит, " +
"то он автоматически становится вашей собственностью. Вы считаете себя непривлекательной " +
"и боитесь, что он бросит вас ради какой нибудь красавицы. Вы ни в чем не уверены, особенно " +
"в нем. Задумайтесь над этим, потому что нельзя быть настолько ревнивой и агрессивной, это " +
"может привести к конфликтам и даже к разрыву отношений.",

# 5–9 ответов «да»
"Ваша ревность действует на вас мобилизующе, но не она одна управляет вашим поведением. " +
"В минуту слабости случается и вам устраивать скандалы.Но, успокоившись, вы понимаете, " +
"что для вашей ревности не было никаких оснований.",

# Менее 5 ответов «да»
"Вам совершенно незнакомо чувство ревности. Но тревога и беспокойство могут накапливаться " +
"со временем.Вы должны решать волнующие вас проблемы со своим партнером."
]

puts "Введите ваше имя:"
name = gets.chomp.capitalize
puts "Здравствуйте #{name}!\n Давайте проверим, ревнивы ли вы!?"
puts "Ответьте на вопросы, только \"да\" или \"нет\""

yes_answers = 0

for item in questions
  puts item
  user_input = nil
  while (user_input != "да" && user_input != "нет")
    puts "Введите да или нет"
    user_input = STDIN.gets.chomp.downcase
  end
  if user_input == "да"
    yes_answers += 1
  end
end

if yes_answers >= 10
  puts results[0]
elsif yes_answers >= 5
  puts results[1]
else
  puts results[2]
end