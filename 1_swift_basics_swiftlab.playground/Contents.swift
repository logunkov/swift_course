// Основы Swift.
// урок 01 - переменные и константы
print("урок 01")
var currentAttemps = 1
let maximumNumberAttemps = 10

// урок 02 - комментарии
print("\nурок 02")
// однострочный комментарий
/* многострочный комментарий */
/** справоочный комментарий */

// урок 03 - целые числа и числа с плавающей точкой
print("\nурок 03")
let minValue = UInt8.min
let maxValue = UInt8.max

// урок 04 - строгая типизация
print("\nурок 04")
let meaningOfLife = 42 // Int
let pi = 3.14159 // Double
let anotherPi = 3 + 0.14159 // Double

let decimalInt = 17
let binaryInt = 0b10001
let octalInt = 0o21
let hexInt = 0x11

let decimalDouble = 12.1875
let expDouble = 1.21875e1
let hexDouble = 0xC.3p0

let oneMillion = 1_000_000

// урок 05 - преобразование типов
print("\nурок 05")
let twoThousand: UInt16 = 2000
let one: UInt8 = 1
let twoThousandOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFive = 0.14159
let numberPi = Double(three) + pointOneFourOneFive

// урок 06 - псевдонимы типов и логические типы
print("\nурок 06")
typealias AudioSample = UInt16
let maxValueAS = AudioSample.max

let isHide: Bool = false

// урок 07 - кортежи
print("\nурок 07")
let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error

let (justStatusCode, _) = http404Error
print("Только код статуса: \(justStatusCode)")

print("Код статуса: \(statusCode)")
print("Сообщение: \(statusMessage)")

print("Код статуса: \(http404Error.0)")
print("Сообщение: \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("Код статуса: \(http200Status.statusCode)")
print("Сообщение: \(http200Status.description)")

// урок 08 - инструкция if
print("\nурок 08")
var temperature = 32
if temperature <= 0 {
    print ("Очень холодно! Одевайтесь теплее.")
} else if temperature >= 30 {
    print("На улице тепло. Одевайте футболку.")
} else {
    print("Не очень холодно, но все же наденьте куртку.")
}

// урок 09 - опциональные типы
print("\nурок 09")
let possibleNumber = "123q"
let convertedNumber = Int(possibleNumber)

if let actualNumber = convertedNumber {
    print("possibleNumber содержит некоторое значение = \(actualNumber)")
} else {
    print ("possibleNumber не содержит число")
}

// урок 10 - опциональные привязки и логические условия
print("\nурок 10")
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber) < 100")
}

// урок 11 - неявно извлеченные опционалы
print("\nурок 11")
let possibleString: String? = "Опциональная строка"
let forcedString: String = possibleString!

var assumrdString: String! = "Неявно извлеченный опционал"
let implictString: String = assumrdString

// урок 12 - базовые операторы
print("\nурок 12")
// -a, a!
// a ? b : c
// +, -, *, /, %

// урок 13 - составные операторы присваивания, сравнения и объединения по nil
print("\nурок 13")
let four = 4
let minusFour = -four

var a = 1
a += 2

// >, <, >=, <=, !=, ==

let defaultColor = "red"
var userDefineColor: String?
var colorToUse = userDefineColor ?? defaultColor

// урок 14 - логические операторы
print("\nурок 14")
// !, &&, ||
let allowedEntry = false
if !allowedEntry {
    print("Доступ запрещен!")
}

let entereDoorCode = true
let passedRetinaScan = true
if entereDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("Доступ запрещен!")
}

let hasDoorKey = false
let adminPassword = false
if hasDoorKey || adminPassword {
    print("Welcome!")
} else {
    print("Доуступ запрещен!")
}

// урок 15 - многострочные литеры строк и специальные символы
print("\nурок 15")
var multiLineStr = """
Эта строка начинается без пробела
    Эта строка имеет 4 пробела
Этас строка также начинается без пробела
"""
print(multiLineStr)

var str = "\' Специальные\t\"символы\\\nНовая строка"
print(str)
let dollarSign = "\u{24}"
let heart = "\u{1F496}"

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Пустая строка!")
}
// урок 16 - работа со строками
print("\nурок 16")
for character in "Dog!" {
    print(character)
}

let catCharacters: [Character] = ["C", "a", "t", "!"]
let catString = String(catCharacters)
print(catString)

let string1 = "hello"
let string2 = " world"
var welcome = string1 + string2
print(welcome)

welcome += "!"
print(welcome)

let exclamationMark: Character = "!"
welcome.append(exclamationMark)
print(welcome)

let multiplier = 3
let massage = "\(multiplier) time 2.5 \(Double(multiplier) * 2.5)"
print(massage)

// урок 17 - индексы строки
print("\nурок 17")
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
greeting[greeting.index(greeting.startIndex, offsetBy: 7)]

for index in greeting.indices {
    print(greeting[index], terminator: " ")
}
print()

var welcomeMessage = "hello"
welcomeMessage.insert("!",at: welcomeMessage.endIndex)

welcomeMessage.insert(contentsOf: " there", at: welcomeMessage.index(before: welcomeMessage.endIndex))
print(welcomeMessage)

welcomeMessage.remove(at: welcomeMessage.index(before: welcomeMessage.endIndex))
print(welcomeMessage)

let range = welcomeMessage.index(welcomeMessage.endIndex, offsetBy: -6)..<welcomeMessage.endIndex
welcomeMessage.removeSubrange(range)
print(welcomeMessage)

let greeting2 = "Hello, world!"
let ind = greeting2.firstIndex(of: ",") ?? greeting2.endIndex
let begining = greeting2[..<ind]
print(begining)

// урок 18 - сравнение строк
print("\nурок 18")
let quotation = "Мы похожи"
let SomeQuotation = "Мы похожи"
if quotation == SomeQuotation {
    print("Эти строки равны.")
}

let romeoAndJuliet = [
"Act 1 Scene 1: ",
"Act 1 Scene 2: ",
"Act 1 Scene 3: ",
"Act 1 Scene 4: ",
"Act 1 Scene 5: ",
"Act 2 Scene 1: ",
"Act 2 Scene 2: ",
"Act 2 Scene 3: ",
"Act 2 Scene 4: ",
"Act 2 Scene 5: ",
"Act 2 Scene 6: "
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("Всего \(act1SceneCount) сцен в Акте 1")

// урок 19 - отображение строк юникода
print("\nурок 19")
let dogString = "Dog→🐶"
dogString.count

for codeUnit in dogString.utf8 {
    print("\(codeUnit)", terminator: " ")
}
print()

for codeUnit in dogString.utf16 {
    print("\(codeUnit)", terminator: " ")
}
print()

for scalar in dogString.unicodeScalars {
    print("\(scalar.value)", terminator: " ")
}
print()

// урок 20 - массивы
print("\nурок 20")
var someInts = [Int]()
someInts.append(3)
someInts.count

someInts = []

var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

// урок 21 - доступ и изменение массива
print("\nурок 21")
var shoppingList: [String] = ["яйца", "молоко"]

if shoppingList.isEmpty {
    print("Список покупок пуст")
} else {
    print("Список покупок не пустой")
}

shoppingList.append("мука")
shoppingList.count

shoppingList += ["разрыхлитель"]
shoppingList += ["шоколад", "сыр", "масло"]
shoppingList.count

var firsItem = shoppingList[0]
shoppingList[0] = "шесть яиц"

shoppingList[4...6] = ["бананы", "яблоки"]
shoppingList.insert("сироп", at: 0)

let syrup = shoppingList.remove(at: 0)
let apples = shoppingList.removeLast()
shoppingList

// урок 22 - итерация по массиву
print("\nурок 22")
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("\(index + 1). \(value)")
}
// урок 23 - множества
print("\nурок 23")
var favoriteGenres: Set = ["Rock", "Classical"]
favoriteGenres.insert("Hip hop")

// урок 24 - доступ и изменение множества
print("\nурок 24")
if let removedGenre = favoriteGenres.remove("Rock") {
    print("Удалили элемент \(removedGenre)")
} else {
    print("Такого элемента нет")
}

for genre in favoriteGenres {
    print(genre)
}

if favoriteGenres.contains("Funk") {
    print("О! Да я встал с правильной ноги!")
} else {
    print("Слишком много Funk'a тут")
}

for genre in favoriteGenres.sorted() {
    print(genre)
}

// урок 25 - операции с множествами
print("\nурок 25")
let oddDigits: Set = [1, 3, 4, 7, 9]
let singlePrimeDigits: Set = [2, 3, 5, 7]

oddDigits.intersection(singlePrimeDigits)
oddDigits.symmetricDifference(singlePrimeDigits)
oddDigits.union(singlePrimeDigits)
oddDigits.subtracting(singlePrimeDigits)

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐭", "🐧"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)

// урок 26 - словари
print("\nурок 26")
var nameOfIntegers = [Int: String]()
nameOfIntegers[16] = "sixteen"
nameOfIntegers = [:]

var airports = ["VYZ": "Toronto Pearson", "DUB": "Dublian"]
airports["LHR"] = "London"
airports["LHR"] = "london Heathrow"

if let oldValue = airports.updateValue("Dublin Airpor", forKey: "DUB") {
    print("Старое значение для ключа DUB было \(oldValue)")
}

airports["DUB"] = nil

if let airportName = airports["DUB"] {
    print("Название аэропорта \(airportName)")
} else {
    print("Нет такого аэропорта в словаре")
}

// урок 27 - итерация по словарю
print("\nурок 27")
for (airportsCode, airportsName) in airports {
    print("\(airportsCode): \(airportsName)")
}

for airportsCode in airports.keys {
    print("Код аэропорта: \(airportsCode)")
}

for airportsName in airports.values {
    print("Название аэропорта: \(airportsName)")
}

let airportsCode = [String](airports.keys)
let airportsName = [String](airports.values)

// Основы Swift. Управление потоком.
// урок 28 - цикл for-in
print("\nурок 28")
let names = ["Anna", "Alex", "Brain", "Jack"]
for name in names {
    print("Hello, \(name)")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

for index in 1...5 {
    print("\(index) умножить на 5 будет: \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print(answer)

// урок 29 - полузамкнутый диапазон и итерации с интервалами
print("\nурок 29")
let minutes = 60
for tickMark in 0..<minutes {
    print(tickMark)
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}

let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours, by: hourInterval) {
    print(tickMark)
}

// урок 30 - цикл while
print("\nурок 30")
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[3] = 8;       board[6] = 11;      board[9] = 9;   board[10] = 2;
board[14] = -10;    board[19] = -11;    board[22] = -2; board[24] = -8;

var square = 0
var diceRoll = 0

while square < finalSquare {
    //бросок кубика
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    // делаем ход
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
    print(square)
}
print("Game Over!")

// урок 31 - цикл repeat - while
print("\nурок 31")
square = 0
diceRoll = 0
repeat {
    square += board[square]
    //бросок кубика
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    // делаем ход
    square += diceRoll
    print(square)
} while square < finalSquare
print("Game Over!")

// урок 32 - инструкция switch
print("\nурок 32")
let someChar: Character = "f"
switch someChar {
case "a":
    print("Это первая буква алфавита")
case "z":
    print("Это последняя буква алфавита")
default:
    print("Это другая буква")

}

// урок 33 - составные диапазоны
print("\nурок 33")
let yearsOld = 20
switch yearsOld {
case 0..<7:
    print("ребенок")
case 7..<17:
    print("ученик")
case 17..<22:
    print("стдент")
case 22..<65:
    print("работник")
default:
    print("пенсионер")
}

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) в начале координат")
case (_, 0):
    print("\(somePoint) лежит на оси Y")
case (0, _):
    print("\(somePoint) лежит на оси X")
case (-2...2, -2...2):
    print("\(somePoint) внутри области")
default:
    print("\(somePoint) за пределами области")
}

// урок 34 - привязка значений
print("\nурок 34")
let anotherPoint = (2 ,0)
switch anotherPoint {
case (let x, 0):
    print("Лежит на оси X и значение x = \(x)")
case (0, let y):
    print("Лежит на оси Y и значение y = \(y)")
case (let x, let y):
    print("Лежит где-то еще (\(x), \(y)")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("\(x), \(y) лежит на прямой x = y")
case let (x, y) where x == -y:
    print("\(x), \(y) лежит на прямой x = -y")
case (let x, let y):
    print("Лежит где-то еще (\(x), \(y)")

}

// урок 35 - составные кейсы
print("\nурок 35")
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) - гласная")
case "b", "c", "d", "f", "g":
    print("\(someCharacter) - согласная")
default:
    print("\(someCharacter) - не буква")
}

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("Лежит на одной из оси на расстоянии от начала координат \(distance)")
default:
    print("Точка лежит где-то еще")
}

// урок 36 - оператор continue
print("\nурок 36")
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charToRemove: [Character] = ["a", "e", "i", "o", "u", " "]

for char in puzzleInput {
    if charToRemove.contains(char) {
        continue
    }
    puzzleOutput.append(char)
}
print(puzzleOutput)

// урок 37 - оператор break
print("\nурок 37")
let numberSymbol: Character = "3"
var possibleInt: Int?
switch numberSymbol {
case "1":
    possibleInt = 1
case "2":
    possibleInt = 2
case "3":
    possibleInt = 3
case "4":
    possibleInt = 4
default:
    break
}
if let intValue = possibleInt {
    print("Integer value of \(numberSymbol) is \(intValue)")
} else {
    print("Integer value could not be found for \(numberSymbol)")
}

// урок 38 - оператор fallthrough
print("\nурок 38")
let intToDescrible = 5
var description = "The number \(intToDescrible) is"
switch intToDescrible {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer"
}
print(description)

// урок 39 - маркированные инструкции
print("\nурок 39")
square = 0
diceRoll = 0

gameLoop: while square < finalSquare {
    //бросок кубика
    diceRoll += 1
    if diceRoll == 7 {diceRoll = 1}
    // делаем ход
    switch square + diceRoll {
    case finalSquare:
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        continue gameLoop
    default:
        square += diceRoll
        square += board[square]
    }
    if square < board.count {
        square += board[square]
    }
    print(square)
}
print("Game Over!")

// урок 40 - ранний выход
print("\nурок 40")
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Привет, \(name)!")

    guard let location = person["location"] else {
        print("Надеюсь у тебя все хорошо!")
        return
    }
    print("Надеюсь в \(location) хорошая погода")
}

greet(person: ["name": "John"])
greet(person: ["name": "jane", "location": "Cupertino"])

// Основы Swift. Функции.
// урок 41 - объявление и вызов функции
print("\nурок 41")
func greet(person: String) -> String {
    let greeting = "Hello, \(person)!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brain"))

// урок 42 - параметры функции и возвращаемые значения
print("\nурок 42")
func sayHelloWorld() -> String {
    return "Hello, world!"
}

print(sayHelloWorld())

func greetAgain(person: String) -> String {
    let greeting = "Hello again, \(person)!"
    return greeting
}

func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: true))

// урок 43 - функции не возвращающие значения
print("\nурок 43")
func greet2(person: String) {
    print("Hello, \(person)!")
}

greet2(person: "Dave")

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "Hello, world")
printWithoutCounting(string: "Hello, world!")

// урок 44 - функции возвращающие несколько значений
print("\nурок 44")
func minMax(array: [Int]) ->(min: Int, max: Int)? {
    if array.isEmpty { return nil}

    var currentMin = array[0]
    var currentMax = array[0]

    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [1,2,3,4,40,-40]) {
    print("Min = \(bounds.min); Max = \(bounds.max)")
} else {
    print("Array is empty")
}
// урок 45 - ярлыки аргументов и имена параметров функций
print("\nурок 45")
func greet(person: String, from homeTown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(homeTown)."
}
print(greet(person: "Bill", from: "Cupertino"))

func greetPerson(_ person: String) -> String {
    let greeting = "Hello, \(person)!"
    return greeting
}

print(greetPerson("Alex"))

func multiplay(a: Int, b: Int = 5) -> Int {
    return a * b
}

multiplay(a: 5, b: 6)
multiplay(a: 3)

// урок 46 - вариативные параметры
print("\nурок 46")
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(2, 5.25, 16.75)

// урок 47 - сквозные параметры
print("\nурок 47")
func swapTwoInts (_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print(someInt, anotherInt)

// урок 48 - функциональные типы
print("\nурок 48")
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = multiplyTwoInts
print("Результат: \(mathFunction(2, 3))")

// урок 49 - использование функциональных типов
print("\nурок 49")
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Результат: \(mathFunction(a,b))")
}

printMathResult(multiplyTwoInts, 3, 5)

func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func ChooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = -4
let moveNearerToZero = ChooseStepFunction(backward: currentValue > 0)
print("Отсчет до нуля:")

while currentValue != 0 {
    print("\(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}
print("Zero")

// урок 50 - вложенные функции
print("\nурок 50")
func ChooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }

    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }

    return backward ? stepBackward : stepForward
}

currentValue = 4
let moveNearerToZero2 = ChooseStepFunction2(backward: currentValue > 0)
print("Отсчет до нуля:")

while currentValue != 0 {
    print("\(currentValue)")
    currentValue = moveNearerToZero2(currentValue)
}
print("Zero")

// урок 51 - замыкания
print("\nурок 51")
let namesStudent = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func bacward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = namesStudent.sorted(by: bacward)
reversedNames = namesStudent.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2})

reversedNames = namesStudent.sorted(by: {s1, s2 in
    return s1 > s2})

reversedNames = namesStudent.sorted(by: {$0 > $1})
reversedNames = namesStudent.sorted(by: >)
print(reversedNames)

// урок 52 - последующее замыкание
print("\nурок 52")
reversedNames = namesStudent.sorted { $0 > $1 }
print(reversedNames)

let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
                 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]

let numbers = [18, 63, 345]
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)

// урок 53 - захват значений
print("\nурок 53")
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementBySeven()

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

// урок 54 - сбегающие замыкания
print("\nурок 54")
var completionHandlers: [() -> Void] = []
func someFuncWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFuncWithoutEscapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomthing() {
        someFuncWithEscapingClosure {
            self.x = 100
        }
        someFuncWithoutEscapingClosure {
            x = 200
        }
    }
}

let instance = SomeClass()
instance.doSomthing()
print(instance.x)

completionHandlers.first?()
print(instance.x)

// урок 55 - автозамыкания
print("\nурок 55")
var customerInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customerInLine.count)

let customerProvider = { customerInLine.remove(at: 0)}
print(customerInLine.count)

print("Now serving \(customerProvider())!")
print(customerInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: {customerInLine.remove(at: 0)})
print(customerInLine.count)

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customerInLine.remove(at: 0))
print(customerInLine.count)

//Задания по теме Основы Swift
//Задание 1
print("\nзадание 1")
//Определить является ли данное целое число R четным. Дать словесный ответ.
let checkNumber = 11
if checkNumber % 2 == 0 {
    print("\(checkNumber) - четное число")
} else {
    print("\(checkNumber) - нечетное число")
}
//Задание 2
print("\nзадание 2")
//Даны положительные целые числа A, B, C. Выяснить существует ли треугольник с длинами сторон A, B, C.
let sideA = 10
let sideB = 10
let sideC = 14
if (sideA + sideB) > sideC && (sideA + sideC) > sideB && (sideB + sideC) > sideA {
    print("Треугольник существует")
} else {
    print("Такого треугольника нет в природе")
}

//Задание 3
print("\nзадание 3")
//Дан массив из 10 целых чисел. Найти произведение положительных. А также сумму и количество отрицательных чисел.
let arrayNumber = [1, 2, 3, 4, 5, -1, -2, -3, -4, -5]
var resultmMltiplication = 1
var resultSum = 0
var resultCount = 0

for tmp in arrayNumber {
    if tmp > 0 {
        resultmMltiplication *= tmp
    } else if tmp < 0 {
        resultSum += tmp
        resultCount += 1
    }
}
print("Произведение положительных чисел = \(resultmMltiplication)")
print("Количество отрицательных чисел = \(resultCount) и их сумма = \(resultSum)")

//Задание 4
print("\nзадание 4")
//Из N целых чисел, записанных в массиве, найти минимальное значение.
let arrayNumberN = [1, 2, 3, 4, 5, -1, -2, -3, -4, -5]
var arrayNumberNMin = arrayNumberN[0]
var arrayNumberNMax = arrayNumberN[0]

for tmp in arrayNumberN {
    if tmp < arrayNumberNMin {
        arrayNumberNMin = tmp
    } else if tmp > arrayNumberNMax {
        arrayNumberNMax = tmp
    }
}
print("Max число = \(arrayNumberNMax)")
print("Min число = \(arrayNumberNMin)")

//Задания по теме Основы Swift. Управление потоком.
//Задание 5
print("\nзадание 5")
//Каждый год урожайность повышается на 5%. Написать алгоритм, который рассчитает через сколько лет урожай удвоится?
var productivity = 100.0
let productivityEnd = 2 * productivity
var resultYear = 0


while productivity <=  productivityEnd{
    productivity *= 1.05
    resultYear += 1
}
print("Урожай удвоится через \(resultYear) лет ")

//Задание 6
print("\nзадание 6")
//Вывести на экран все простые числа до заданного.
var resultNumberSimple = [Int]()
let numberSimple = 21
var isSimple: Bool
for tmp  in 2..<numberSimple {
    isSimple = true
    for tmp2 in 2..<tmp {
        if tmp % tmp2 == 0 {
            isSimple = false
            break
        }
    }
    if isSimple {
        resultNumberSimple.append(tmp)
    }
}
print("все простые числа до \(numberSimple) : \(resultNumberSimple)")

//Задание 7
print("\nзадание 7")
//Определить, является введенное слово «перевертышем» (потоп, казак). Вывести словесный ответ.
let text = "казак"
let textCount = text.count / 2 - 1
var index1, index2: String.Index
var set1 = 0
for tmp in 0...textCount {
    index1 = text.index(before: text.index(text.endIndex, offsetBy: -tmp))
    index2 = text.index(before: text.index(text.startIndex, offsetBy: tmp + 1))
    if text[index1] != text[index2] {
        set1 = 1
        break
    }
}
if set1 == 0 {
    print("Слово \"\(text)\" - перевертыш")
} else {
    print("Слово \"\(text)\" - не перевертыш")
}

//Задание 8
print("\nзадание 8")
//Дана строка, состоящая из открывающихся и закрывающихся круглых скобок в произвольной последовательности.
//Проверить правильность написания круглых скобок, чтобы каждая открывающаяся скобка была закрыта.
let bracketedText = "(a(b(c)d)e)f)"
var sumOpeningBracket = 0
var sumClosingBracket = 0

for tmp in bracketedText {
    if tmp == "(" {
        sumOpeningBracket += 1
    } else if tmp == ")" {
        sumClosingBracket += 1
    }
}

if sumOpeningBracket == sumClosingBracket {
    print("Каждая открывающаяся скобка закрыта закрывающих скобкой")
} else {
    print("Количество открывающих скобок не равно количеству закрывающих скобок")
}

//Задание 9
print("\nзадание 9")
//Дана строка, состоящая из открывающихся и закрывающихся круглых скобок, квадратных и фигурных в произвольной последовательности.
//Проверить правильность написания скобок, чтобы каждая открывающаяся скобка была закрыта соответствующим типом закрывающейся скобки.
let bracketedTextAll = "(a{b[c]d}e)f)"
var sumOpeningBracketRound = 0
var sumClosingBracketRound = 0

var sumOpeningBracketCurly = 0
var sumClosingBracketCurly = 0

var sumOpeningBracketSquare = 0
var sumClosingBracketSquare = 0

for tmp in bracketedTextAll {
    switch tmp {
    case "(":
        sumOpeningBracketRound += 1
    case ")":
        sumClosingBracketRound += 1
    case "{":
        sumOpeningBracketCurly += 1
    case "}":
        sumClosingBracketCurly += 1
    case "[":
        sumOpeningBracketSquare += 1
    case "]":
        sumClosingBracketSquare += 1
    default:
        continue
    }
}

if sumOpeningBracketRound == sumClosingBracketRound && sumOpeningBracketCurly == sumClosingBracketCurly && sumOpeningBracketSquare == sumClosingBracketSquare {
    print("Каждая открывающаяся скобка закрыта закрывающих скобкой")
} else {
    print("Количество открывающих скобок не равно количеству закрывающих скобок")
}

//Задания по теме Основы Swift. Функции.
//Задание 10
print("\nзадание 10")
//Сгенерировать массив из 100 случайных чисел и отсортировать его всеми известными вам методами.
var arrayNumb = [Int]()
for _ in 0...100 {
    arrayNumb.append(Int.random(in: 1...99))
}
print(arrayNumb)
arrayNumb.sort(by: >)
print(arrayNumb)
arrayNumb.sort(by: < )
print(arrayNumb)

//Задание 11
print("\nзадание 11")
//Написать две функции: перевод из десятичной системы в шестнадцатеричную и обратно.
let NumberInt = 17
let NumberHex = 0x11
let arrayHex = [0: "0", 1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9", 10: "A", 11: "B", 12: "C", 13: "D", 14: "E", 15: "F"]

func numberHex(_ number: Int) -> Void {
var number = number
var output = ""
    repeat {
        output = arrayHex[number % 16]! + output
        number /= 16
    } while number > 0
print("0x\(output)")
}

func numberInt(_ number: Int) -> Void {
    print(number)

}

numberHex(NumberInt)
numberInt(NumberHex)

//Задание 12
print("\nзадание 12")
/*Представьте, что вы являетесь преподавателем курсов по шахматам. Ваши занятия посещают три ученика.
Создайте словарь, который будет содержать информацию о ваших студентах и об их успехах. Ключом словаря должна быть фамилия, а значением — другой словарь,
содержащий дату занятия и полученную на этом занятии оценку.
Тип данных словаря должен быть [String:[String:UInt]].
В вашем электронном журнале должно находиться по две оценки для каждого из трех учеников. Фамилии, даты занятий и оценки придумайте сами.
Посчитайте средний балл каждого студента и средний балл всей группы целиком и выведите всю полученную информацию на консоль.*/

let chessPlayers = ["Harry": ["2022.10.01": 4, "2022.10.06": 5] ,
                    "Ron": ["2022.10.01": 3, "2022.10.06": 4],
                    "Hermione": ["2022.10.01": 5, "2022.10.06": 5]]
var averageMarkAll = 0
var marcCount = 0

for player in chessPlayers {
    var averageMark = 0
    for mark  in player.value {
        averageMark += mark.value
        averageMarkAll += mark.value
    }
    print("Средний бал студента \"\(player.key)\": \(Double(averageMark) / Double(player.value.count))")
    marcCount += player.value.count
}
let resultMark = (Double(averageMarkAll) / Double(marcCount) * 10).rounded() / 10
print("Средний бал студентов: \(resultMark)")
