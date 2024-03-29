# Винятки в рубі

Exception (виключення являються підкласом класа Exception)
    |--fatal
    |--NoMemoryError    не хватає памяті
    |--ScriptErorr
    |    |--LoadErorr
    |    |--NotImplementedError  виклик не реалізованого методу (заглушка)
    |    |--SyntaxError  синтатична помилка
    |--SecurityErorr    
    |--SignalExeption
    |    |--Interrput
    |--StandardError
    |    |--ArgumentError   пердаетьмя неправильний аргумент 
    |    |--FiberError
    |    |--IndexError
    |    |   |--KeyErorr
    |    |   |--StopIteration
    |    |--IOError
    |    |   |--EOFErorr
    |    |--LocalJampError
    |    |--NameErorr
    |    |   |--NoMethodError
    |    |--RangeError
    |    |   |--FloatGomainError
    |    |--RegexpError
    |    |--RuntimeError     наша назначена помилка
    |    |--SystemCallError
    |    |   |--system-dependent exeptions (Errno::xxx)
    |    |--ThreadError
    |    |--TypeError
    |    |--ZeroDevisionError
    |--SystemExit
    |--SystemStackError


-----------------------------------------------------------


# ---Опис помилки (виключення) (коли стається виключення програма переривається)
    # 2 + "str" => TypeError: String con't be coerected into Fixnum # тип помилки: повідомлення помилки (винятка)
    * потім знизу йду бек трейс (ланцюжок виклику команд)

-----------------------------------------------------------


----------Обробка виключень--------------(Якщо ми виконаємо обробку виключення то після виключення код виконається)
begin
    a = 1 / 0   
rescue    (якщо вказати клаас виключення (rescue SyntaxError) то rescue спрацює лише на цьму виді виключення )
    puts "you can't do that'#{a}'" Якщо виключення то виконаеться цей код (перехватує всі виключення)
end

-----------------------------------------------------------

begin
    a = 1 / 0   
rescue Exception => e     (rescue на всі виключення та передаемо виключення через "e") ( * емулюемо стандартну поведінку Exception в rubi)
    puts e      Виводим Тип та повідомлення виключення
    puts e.backtrace.inspect      Виводим бектрейс
end

-----------------------------------------------------------

StandardError  (безпечний класс майже всіх виключень)

begin         (обробляемо код двума оборбниками виключень)
    a = 1 / 0   
rescue StandardError     
    puts "somesing wrongs"
    raise    (викидаємо обробку виключень)
rescue NoMemoryError    
    puts "Немає память"
end

---------------------------------------------------------

def method_with_error
    # .....
    raise "error"
end

begin
    method_with_error
rescue RuntimeError => e
    puts "try agine"
    puts e-inspect
end

--------------------------------------------------------

@b = 1

def switch_021(num)
  a = ["off", "on"]
  raise "you can`t` turn this swich 0n this position" if num == @b    #Виключення якщо.
  puts "#{a[num]}"
end

begin # Відловлення виключння
  switch_021(gets.chomp.to_i)
rescue RuntimeError => e 
  puts e.inspect
  switch_021(gets.chomp.to_i)
end

-------------------------------------------------------------

@b = 1

def switch_021(num)
  a = ["off", "on"]
  raise ArgumentErorr, "ArgumentErorr" (передаємо клас викидання виняику)
end

begin # Відновлення виключння
  switch_021(gets.chomp.to_i)
rescue ArgumentErorr => e 
  puts e.inspect
  switch_021(gets.chomp.to_i)
end

-------------------------------------------------------------

def sqrt(value)
    puts Math.sqrt(value)
rescue StandardError
    purs "не правильне значення"
end    
------------------------------------------------------------
# Представимо приклад нам потрібно підключитися до сайту він видає помилку підключення но нам потрібно зробити декілька спроб
def connec_to_wikipedia
    #.....
    raise "Connect error"
end

attempt = 0
begin  #!!!!! можна вставляти в середину методу для перевірки частини коду 
    connec_to_wikipedia
rescue RuntimeError
    attempt += 1
    puts "Try: #{attempt + 1}"
    retry if attempt < 3 # повертаэмся до begin
    puts "Check connect you internet conection"
    ensure
        puts "Код який виконуэться в будь-якому випадку неважливо чи була помидка"
    end
end


begin
    connec_to_wikipedia
rescue RuntimeError
    puts ""
    retry
end

--------------------------------------------------------

class ClassName
    attr_accessor :number
    def initialize(number)
        @number = number
        validate!
    end

    def validate!
        raise "Minimum Leamgth number 6 symbol" if @number.length < 6
    end
end

-----------------------------------------------------
# Шаблон регулярного виразу для дорожнього номера ("^"-початок сроки, "[а-яА-я]{1}"-одна кирилична буква, "\d{2}" двы цифри, "$"- кінець сутроки)
"а22" =~ /^[а-яА-я]{1}\d{2}$/
"а22" !~ /^[а-яА-я]{1}\d{2}$/

# [abc]	Один символ: a, b или c
# i     Не чуствительный к регистру  (устанавл. в конце выражения после скобок)
# [^abc]	Любой одиночный символ, кроме: a, b или c
# [a-z]	Любой одиночный символ в диапазоне az
# [a-zA-Z]	Любой одиночный символ в диапазоне az или AZ
# ^	Начало строки
# $	Конец линии
# \A	Начало строки
# \z	Конец строки
# .	Любой одиночный символ
# \s	Любой пробельный символ
# \S	Любой непробельный символ
# \d	Любая цифра
# \D	Любая не цифра
# \w	Любой символ слова (буква, цифра, подчеркивание)
# \W	Любой символ, не являющийся словом
# \b	Любая граница слова
# (...)	Захватите все, что закрыто
# (a|b)	а или б
# a?	Ноль или один из
# a*	Ноль или более
# a+	Один или несколько из
# a{3}	Ровно 3 из
# a{3,}	3 или более
# a{3,6}	Между 3 и 6 часами
# параметры: iнечувствительны к регистру mсделать точки соответствуют новым строкам xигнорировать пробелы в регулярном выражении oвыполнять #{...} замены только один раз
------------------------------------------------------

Код проекта: github.com                     https://github.com/vkurennov/ror-beginner/tree/master/exceptions
rubular.com                                 http://rubular.com/
Ruby Exceptions: www.honeybadger.io         https://www.honeybadger.io/blog/a-beginner-s-guide-to-exceptions-in-ruby/
Regular Expressions: www.rubyguides.com     https://www.rubyguides.com/2015/06/ruby-regex/

-------------------------------------------------------

- Реализовать проверку (валидацию) данных для всех классов. Проверять основные атрибуты (название, номер, тип и т.п.) на наличие, длину и т.п. (в зависимости от атрибута):

- Валидация должна вызываться при создании объекта, если объект невалидный, то должно выбрасываться исключение

- Должен быть метод valid? который возвращает true, если объект валидный и false - в противном случае.

- Релизовать проверку на формат номера поезда. Допустимый формат: три буквы или цифры в любом порядке, необязательный дефис (может быть, а может нет) и еще 2 буквы или цифры после дефиса.

- Убрать из классов все puts (кроме методов, которые и должны что-то выводить на экран), методы просто возвращают значения. (Начинаем бороться за чистоту кода).

- Релизовать простой текстовый интерфейс для создания поездов (если у вас уже реализован интерфейс, то дополнить его):

- Программа запрашивает у пользователя данные для создания поезда (номер и другие необходимые атрибуты)

- Если атрибуты валидные, то выводим информацию о том, что создан такой-то поезд

- Если введенные данные невалидные, то программа должна вывести сообщение о возникших ошибках и заново запросить данные у пользователя. Реализовать это через механизм обработки исключений



В качестве ответа приложить ссылку на репозиторий с решением

def validate!
    raise RegexpError, ERROR if @number !~ NUMBER_FORMAT
  end

  def valid?
    validate!
    true
  rescue RegexpError
    false
  end

Вот так должно быть.
В initialize вызываете validate!

Ловите его через retry в интерфейсе
scoutapm.com   https://scoutapm.com/blog/ruby-retry


И тогда это будет соответствовать тз: (Если введенные данные невалидные, то программа должна вывести сообщение о возникших ошибках и заново запросить данные у пользователя. Реализовать это через механизм обработки исключений)
