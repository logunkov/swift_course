import UIKit
import Foundation

// ООП Swift
// урок 01 - Перечисления
print("урок 01")
enum CompassPoint: String{
    case north
    case south
    case east
    case west
}

enum Planet: Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, neptune
}

var directionToHead = CompassPoint.west
directionToHead = .south

switch directionToHead {
case .north:
    print("Мы уйдем на север")
case .south:
    print("На юге можно увидеть пингвинов")
case .east:
    print("На востоке восходит солнце")
case .west:
    print("На западе голубое небо")
}

let somePlanet = Planet.mars
switch somePlanet {
case .earth:
    print("Земля пригодня для жизни")
default:
    print("эта планета не пригодн для жизни")
}

// урок 02 - Связанные значения перечислений
print("\nурок 02")
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85099, 51226, 3)
productBarcode = .qrCode("Think Different")

switch productBarcode {
case .upc(let numberSysytem, let manufacturer, let product, let check):
    print("UPC: \(numberSysytem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR Code: \(productCode)")
}

// урок 03 - Исходные значения перечислений
print("\nурок 03")
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeeed = "\n"
    case carriageReturn = "\r"
}

let earthsOrder = Planet.earth.rawValue
let sunsetDirection = CompassPoint.west.rawValue
let possiblePlanet = Planet(rawValue: 7)

let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    print("Планета на удивление найдена: \(somePlanet)")
} else {
    print("Нет планеты на \(positionToFind) позиции")
}

// урок 04 - Рекурсивные перечисления
print("\nурок 04")
enum ArithemeticExpression {
    case number(Int)
    indirect case addition(ArithemeticExpression, ArithemeticExpression)
    indirect case multiplication(ArithemeticExpression, ArithemeticExpression)
}

// (5 + 4) * 2

let five = ArithemeticExpression.number(5)
let four = ArithemeticExpression.number(4)
let sum = ArithemeticExpression.addition(five, four)
let product = ArithemeticExpression.multiplication(sum, ArithemeticExpression.number(2))

func evaluate(_ expression: ArithemeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
print(evaluate(product))

// урок 05 - Классы и структуры
print("\nурок 05")
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// урок 06 - Типы значений и ссылочные типы
print("\nурок 06")
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

print("HD: \(hd.width)")
print("Cinema: \(cinema.width)")

var curDirection = CompassPoint.west
let rememberDirection = curDirection
curDirection = .east

print(curDirection.rawValue)
print(rememberDirection.rawValue)

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name  = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEight = tenEighty
alsoTenEight.frameRate = 30.0

print("Frame rate: \(tenEighty.frameRate)")

// урок 07 - Структура vs Класс
print("\nурок 07")
/*
* Инкапсуляция нескольких сравнительно простых значений данных
* Инкапсулированные значения будут скорее скопированы, чем переданы по ссылке, когда вы назначаете или передаете экземпляр структуры
* Любые свойства, хранящиеся в структуре, сами по себе типы значений, которые тоже будут скопированы, а не переданы по ссылке
* Структуры не нуждаются в наследовании свойств или поведения от других существующих типов
*/

// урок 08 - Свойства
print("\nурок 08")
struct FixedLengthRange {
    var firstValue: Int
    let lenght: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, lenght: 3)
rangeOfThreeItems.firstValue = 6
// rangeOfThreeItems.lenght = 6 - Error

class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String()]
}

let manager = DataManager()
manager.data.append("Что-то")
manager.data.append("ещё")

print("\(manager.importer.fileName)")

// урок 09 - Вычисляемые свойства
print("\nурок 09")
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.width / 2
            let centerY = origin.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - size.width / 2
            origin.y = newValue.y - size.height / 2
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 8.0))
let initialSquareCenter = square.center
square.center = Point(x: 7.0, y: 6.0)
print(square.origin)

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let cub = Cuboid(width: 4, height: 5, depth: 2)
print(cub.volume)

// урок 10 - Наблюдатели свойства
print("\nурок 10")
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("Вот-вот значение будет равно \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Добавлено \(totalSteps - oldValue) шагов")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 350
stepCounter.totalSteps = 180

// урок 11 - Свойства типа
print("\nурок 11")
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannel = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannel {
                AudioChannel.maxInputLevelForAllChannel = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannel)

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannel)

// урок 12 - Методы экземпляра
print("\nурок 12")
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.count
counter.increment(by: 5)
counter.count
counter.reset
counter.count

struct Point2 {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint2 = Point2(x: 4.0, y: 5.0)
if somePoint2.isToTheRightOf(x: 1.0) {
    print("Эта точка находится справа от линииБ где x = 1.0")
}

// урок 13 - Изменение типов значений методами экземпляра
print("\nурок 13")
somePoint2.moveBy(x: 2.0, y: 3.0)
print("\(somePoint2)")

enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight
ovenLight.next()
ovenLight

// урок 14 - Методы типа
print("\nурок 14")
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Sergey")
player.complete(level: 1)
print("Максимальный уровень \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Andrey")
if player.tracker.advance(to: 2) {
    print("Игрок на уровне 2")
} else {
    print("Уровень 2 еще не разблокирован")
}

// урок 15 - Сабскрипты
print("\nурок 15")
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("6 * 3 = \(threeTimesTable[6])")

var numberOfLegs = ["паук": 8, "муравей": 6, "кошка": 4]
numberOfLegs["птичка"] = 2

// урок 16 - Опции сабскрипта
print("\nурок 16")
struct Matrix {
    let rows: Int, columns: Int
    var grid:[Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[row * columns + column]
        }
        set{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[row * columns + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2 )
matrix[0, 1] = 1.5 // [0.0 1.5]
matrix[1, 0] = 3.2 // [3.2 0.0]

let someValue = matrix[0, 1]

// урок 17 - Наследования
print("\nурок 17")
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "Движется на скорости \(currentSpeed) км/час"
    }
    func makeNoise() {
        //
    }
}

let someVehicle = Vehicle()
print("Транспорт: \(someVehicle.description)")

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Велосипед: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Тандем: \(tandem.description)")

// урок 18 - Переопределение
print("\nурок 18")
class Train: Vehicle {
    override func makeNoise() {
        print("Чух-чух!")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + "на передаче \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Машина: \(car.description)")

final class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("Машина с автоматом \(automatic.description)")

// урок 19 - Инициализация - установка начальных значений
print("\nурок 19")
struct Fahrenheit {
    var temperature = 32.0
}

var f = Fahrenheit()
print("Значение температуры по умолчанию \(f.temperature) градусов по Фаренгейту")

struct Celsius {
    var tempertureInCelsius: Double
    init(fromFarenheit farenheit: Double) {
        tempertureInCelsius = (farenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        tempertureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        tempertureInCelsius = celsius
    }
}

let boilingPointofWater = Celsius(fromFarenheit: 212.0)
boilingPointofWater.tempertureInCelsius

let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.tempertureInCelsius

let bodyTemperature = Celsius(36.6)
bodyTemperature.tempertureInCelsius

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

// урок 20 - Опциональные типы свойств
print("\nурок 20")
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let cheeeseQuestion = SurveyQuestion(text: "Нравится ли вам Сыр?")
cheeeseQuestion.ask()
cheeeseQuestion.response = "Да, я люблю сыр!"

// урок 21 - Дефолтные инициализаторы и делегирование инициализатора
print("\nурок 21")
class ShoopListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoopListItem()

struct SizeS {
    var width = 0.0, height = 0.0
}
let twoByTwo = SizeS(width: 2.0, height: 2.0)

struct PointS {
    var x = 0.0, y = 0.0
}

struct RectS {
    var origin = PointS()
    var size = SizeS()
    init() {}
    init(origin: PointS, size: SizeS) {
        self.origin = origin
        self.size = size
    }
    init(center: PointS, size: SizeS) {
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.init(origin: PointS(x: originX, y: originY), size: size)
    }
}

let originRect = RectS(origin: PointS(x: 2.0, y: 2.0), size: SizeS(width: 5.0, height: 5.0))
let centerRect = RectS(origin: PointS(x: 4.0, y: 4.0), size: SizeS(width: 3.0, height: 3.0))
let basicRect = RectS()

// урок 22 - Наследование и инициализация класса - теория
print("\nурок 22")

// Назначенные инициализаторы - инициализация всех свойств представленных классом и вызов инициализатора суперкласса
// Вспомогательные инициализаторы - вторичные. Для экономии времени и облегчения инициализации класса. Маркируются ключевым словом convenience

// Делегирование вызовов между инициализаторами
// * Назначенный инициализатор должен делегировать наверх
// * Вспомогательный инициализатор должен делегировать в своем классе

// Проверка безопасности
// 1. Назначенный инициализатор должен инициализировать все своства, представленные его классом, после этого он делегирует наверх
// 2. Назначенный инициализатор должен делегировать суперклассу инициализатор до присваивания значений унаследованным свойствам
// 3. Вспомогательный инициализатор должен делегировать другому инициализатору до того, как будут присвоены значения любым свойствам (включая свойства определенные тем же классом
// 4. Инициализатор не может вызывать методы экземпляра, читать значения любого свойства экземпляра или ссылаться на self как на значение до тех пор, пока не будет закончена первая фраза инициализации

// урок 23 - Наследование и переопределение инициализатора
print("\nурок 23")
class Vehicle2 {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) колес(а, о)"
    }
}

let vehicle2 = Vehicle2()
print("Трнаспортное средство \(vehicle2.description)")

class Bicycle2: Vehicle2 {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle2 = Bicycle2()
print("Велосипед: \(bicycle2.description)")

// урок 24 - Автоматическое наследование инициализатора
print("\nурок 24")
// При наличии новых свойств, им предоставляются значения по умолчанию.
// В таком случае применяются 2 правила:
// 1. Если подкласс не определяет ни одного назначенного инициализатора, он автоматически наследует все назначенные инициализаторы суперкласса
// 2. Если у класса есть реализация всех назначенных инициализаторо его суперкласса (унаследованы по правилу 1 или реализованы в определении подкласса), то тогда подкласс автоматически наследует все вспомогательные инииализаторы суперкласса. Подкласс может реализовать назначенный инициализатор суперкласса как вспомогательный инициализатор подкласса.

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Без названия]")
    }
}

let namedMeat = Food(name: "Бекон")
namedMeat.name

let mysteryMeat = Food()
mysteryMeat.name

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
oneMysteryItem.name

let oneBacon = RecipeIngredient(name: "Бекон")
oneBacon.name
oneBacon.quantity

let sixEggs = RecipeIngredient(name: "Яйца", quantity: 6)
sixEggs.name
sixEggs.quantity

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔︎" : " ✘"
        return output
    }
}

var breakfasList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Бекон"),
    ShoppingListItem(name: "Яйца", quantity: 6)]

breakfasList[0].name = "Сок"
breakfasList[0].purchased = true

for item in breakfasList {
    print(item.description)
}

// урок 25 - Проваливающиеся инициализаторы
print("\nурок 25")
let mayBeNumber = "123"
if let number = Int(mayBeNumber) {
    print("\(number) это число \(mayBeNumber)")
} else {
    print("Не получилось преобразовать \(mayBeNumber)")
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Жираф")
if let giraffe = someCreature {
    print("Мы инициализировали животное \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("Не известное животное не может быть инициализировано")
}

// урок 26 - Проваливающиеся инициализаторы для перечислений
print("\nурок 26")
enum TemperatureUnit: Character {
    case kelvin = "K"
    case celsius = "C"
    case fahrenheit = "F"
}

let farenheitUnt = TemperatureUnit(rawValue: "F")
if farenheitUnt != nil {
    print("Эта единица измерения температуры определена!")
}

let unknowUnit = TemperatureUnit(rawValue: "X")
if unknowUnit == nil {
    print("Единица измерения температуры не определена")
}

// урок 27 - Распространение проваливающегося инициализатора
print("\nурок 27")
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil}
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "носки", quantity: 2) {
    print("Вещь: \(twoSocks.name), количество: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "Футболка", quantity: 0) {
    print("Вещь: \(zeroShirts.name), количество: \(zeroShirts.quantity)")
} else {
    print("Невозможно инициализировать ноль футболок")
}

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Вещь: \(oneUnnamed.name), количество: \(oneUnnamed.quantity)")
} else {
    print("Невозможно инициализировать товар без имени")
}

// урок 28 - Переопределение проваливающегося инициализатора
print("\nурок 28")
class Document {
    var name: String?
    init() {}
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

// урок 29 - Требуемые инициализаторы
print("\nурок 29")
class SomeClassS {
    required init() {
        //
    }
}

class SomeSubclassS : SomeClassS {
    var name: String
    init(name: String) {
        self.name = name
    }
    required init() {
        self.name = "XXX"
    }
}

// урок 30 - Начальное значение свойства в виде функции или замыкания
print("\nурок 30")
struct Cheessboard {
    let boardColors: [Bool] = {
        var tempBord = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                tempBord.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return tempBord
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Cheessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
print(board.squareIsBlackAt(row: 7, column: 7))

// урок 31 - Деинициализация
print("\nурок 31")
class Bank {
    static var coinsInBank = 10_000
    static func distibute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class PlayerS {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distibute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distibute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne: PlayerS? = PlayerS(coins: 100)
print("Новый игрок начал игру с \(playerOne!.coinsInPurse) монетами")
print("Сейчас в банке \(Bank.coinsInBank) монет")

playerOne = nil
print("PlayerOne покинул игру")
print("Сейчас в банке \(Bank.coinsInBank) монет")

// урок 32 - Автоматический подсчет ссылок
print("\nурок 32")
class Person0 {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) инициализируется")
    }
    deinit {
        print("\(name) деинициализируется")
    }
}
var reference1: Person0?
var reference2: Person0?
var reference3: Person0?

reference1 = Person0(name: "John Wick")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

// урок 33 - Циклы сильных ссылок между экземплярами классов
print("\nурок 33")
class PersonS {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: ApartmentS?
    deinit {
        print("\(name) освобождается")
    }
}

class ApartmentS {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: PersonS?
    deinit {
        print("Апартаменты \(unit) освобождаются")
    }
}

var johnS: PersonS?
var unit4aS: ApartmentS?

johnS = PersonS(name: "John Wick")
unit4aS = ApartmentS(unit: "4A")

johnS = nil
unit4aS = nil

// урок 34 - Замена циклов сильных ссылок между экземплярами классов - слабые ссылки (weak)
print("\nурок 34")
class PersonW {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: ApartmentW?
    deinit {
        print("\(name) освобождается")
    }
}

class ApartmentW {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: PersonW? // изменили эту строчку
    deinit {
        print("Апартаменты \(unit) освобождаются")
    }
}

var johnW: PersonW?
var unit4aW: ApartmentW?

johnW = PersonW(name: "John Wick")
unit4aW = ApartmentW(unit: "4A")

johnW = nil
unit4aW = nil

// урок 35 - Бесхозные ссылки (unowned)
print("\nурок 35")
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) деанициализируется")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Карта #\(number) деинициализируется")
    }
}

var john: Customer?
john = Customer(name: "John Wick")
john?.card = CreditCard(number: 1234567890123456, customer: john!)

john = nil

// урок 36 - Бесхозные ссылки и неявно извлеченные опциональные свойства
print("\nурок 36")
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalCity: String) {
        self.name = name
        self.capitalCity = City(name: capitalCity, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Россия", capitalCity: "Москва")
print("Столица страны \(country.name) является \(country.capitalCity.name)")

// урок 37 - Циклы сильных ссылок для замыканий и их замена
print("\nурок 37")
class HTMLElement {
    let name: String
    let text: String?

    lazy var asHTML: () -> String = { [ unowned self ] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "</\(self.name)>"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) деинициализируется")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello world!")
print(paragraph!.asHTML())

paragraph = nil

// урок 38 - Опциональная последовательность
print("\nурок 38")
class PersonZ {
    var residence: ResidenceZ?
}

class ResidenceZ {
    var numberOfRoom = 1
}

let johnZ = PersonZ()

if let roomCount = johnZ.residence?.numberOfRoom {
    print("Резиденция Джона иммет \(roomCount) комнат(а, ы)")
} else {
    print("Невозможно получить колиество комнат")
}

johnZ.residence = ResidenceZ()

if let roomCount = johnZ.residence?.numberOfRoom {
    print("Резиденция Джона иммет \(roomCount) комнат(а, ы)")
} else {
    print("Невозможно получить колиество комнат")
}

// урок 39 - Доступ к свойствам
print("\nурок 39")
class PersonZZ {
    var residence: ResidenceZZ?
}

class ResidenceZZ {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }

    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }

    func printNumberOfRooms() {
        print("Общее количетсво комнат равно \(numberOfRooms)")
    }

    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let johnZZ = PersonZZ()

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
johnZZ.residence?.address = someAddress

func createAddress() -> Address {
    print("Функция вызвана")

    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"

    return someAddress
}

johnZZ.residence?.address = createAddress()

if johnZZ.residence?.printNumberOfRooms() != nil {
    print("Есть возможность вывести общее количество комнат")
} else {
    print("Нет возможности вывести общее количество комнат")
}

if (johnZZ.residence?.address = someAddress) != nil {
    print("Есть возможность вывести общее количество комнат")
} else {
    print("Нет возможности вывести общее количество комнат")
}

if let firstRoomName = johnZZ.residence?[0].name {
    print("Название первой комнаты \(firstRoomName)")
} else {
    print("Никак не получить название первой комнаты")
}

johnZZ.residence?[0] = Room(name: "Спальня")

let johnZZHouse = ResidenceZZ()
johnZZHouse.rooms.append(Room(name: "Гостиная"))
johnZZHouse.rooms.append(Room(name: "Кухня"))
johnZZ.residence = johnZZHouse

if let firstRoomName = johnZZ.residence?[0].name {
    print("Название первой комнаты \(firstRoomName)")
} else {
    print("Никак не получить название первой комнаты")
}

// урок 40 - Обработка ошибок
print("\nурок 40")
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 0)]

    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Продано: \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels"]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

// урок 41 - Обработка ошибок с использование do-catch
print("\nурок 41")
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 10

do {
    try buyFavoriteSnack(person: "Eve", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Ошибка выбора")
} catch VendingMachineError.outOfStock {
    print("Нет в наличии")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Недостаточно средств. Добавте еще \(coinsNeeded) монет")
}

// урок 42 - Преобразование ошибок в опциональные значения и запрет на передачу ошибок
print("\nурок 42")
func someThrowingFunc() throws -> Int {
    return 0
}

let x = try? someThrowingFunc()

let y: Int?
do {
    y = try someThrowingFunc()
} catch {
    y = nil
}

// let photo = try! loadImage(atPath: "./Resourses/John.jpg")

// урок 43 - Установка действий по очистке
print("\nурок 43")
//func processFile(fileName: String) throws {
//    if exists(filename) {
//        let file = open(fileName)
//        defer {
//            close(file)
//        }
//    }
//    while let line = try file.readline() {
//
//    }
//    close(file)
//}

// урок 44 - Приведение типов
print("\nурок 44")
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}


class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")]

// урок 45 - Проверка типа и понижающее приведени
print("\nурок 45")
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("В библиотеке содержится \(movieCount) фильма и \(songCount) песни")

for item in library {
    if let movie = item as? Movie {
        print("Фильмы: \(movie.name), директор: \(movie.director)")
    } else if let song = item as? Song {
        print("Песня: \(song.name), исполняет: \(song.artist)")
    }
}

// урок 46 - Приведение типов для Any и AnyObject
print("\nурок 46")
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("Hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Охотники за привидениями", director: "Иван Рейтман"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch  thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as an Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie clled \(movie.name), dirt. \(movie.director)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}

let optionalNumber: Int? = 3
things.append(optionalNumber as Any)

// урок 47 - Вложенные типы
print("\nурок 47")
struct BlacjackCard {
    enum Suit: Character {
        case spades = "♠️", hearts = "♥️", diamond = "♦️", clubs = "♣️"
    }

    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }

    let rank: Rank, suit: Suit
    var description: String {
        var output = "масть - \(suit.rawValue),"
        output += " значение - \(rank.values.first)"

        if let second = rank.values.second {
            output += " или \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlacjackCard(rank: .ace, suit: .spades)
print("Туз пики: \(theAceOfSpades.description)")

let someCard = BlacjackCard(rank: .king, suit: .hearts)
print(someCard.description)

let heartsSymbol = BlacjackCard.Suit.hearts.rawValue

// урок 48 - Расширения - вычисляемые свойства
print("\nурок 48")
extension Double {
    var km: Double {return self * 1000.0}
    var m: Double {return self}
    var cm: Double {return self / 100.0}
    var mm: Double {return self / 1000.0}
    var ft: Double {return self / 3.28084}
}

let oneInch = 25.4.mm
print("Один дюйм - это \(oneInch) метра")

let threeFeet = 3.ft
print("Три фута - это \(threeFeet) метра")

let aMarathon = 42.km + 195.m
print("Марафон имеет длину \(aMarathon) метров")

// урок 49 - Инициализаторы в расширениях
print("\nурок 49")
struct Size49 {
    var widht = 0.0, height = 0.0
}

struct Point49 {
    var x = 0.0, y = 0.0
}

struct Rect49 {
    var origin = Point49()
    var size = Size49()
}

let defaultRect49 = Rect49()
let memrerwiseRect = Rect49(origin: Point49(x: 2.0, y: 2.0), size: Size49(widht: 5.0, height: 5.0))

extension Rect49 {
    init(center: Point49, size: Size49) {
        let originX = center.x - size.widht / 2
        let originY = center.y - size.height / 2
        self.init(origin: Point49(x: originX, y: originY), size: size)
    }
}

let centerRect49 = Rect49(center: Point49(x: 4.0, y: 4.0), size: Size49(widht: 3.0, height: 3.0))

// урок 50 - Методы в расширениях
print("\nурок 50")

extension Int {
    func reptitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
3.reptitions {
    print("Hello")
}

extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt50 = 3
someInt50.square()
print(someInt50)

// урок 51 - Сабскрипты и вложенные типы в расширениях
print("\nурок 51")
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

746381295[0]
746381295[1]
746381295[2]
0746381295[9]

extension Int {
    enum Kind {
        case negative, zero, positive
    }

    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func printIntegerKinds(_ numbers: [Int]) {
    numbers.forEach { number in
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds([3, 19, -27, 0, -6, 0, 7])

// урок 52 - Протоколы - требование свойств
print("\nурок 52")
protocol SomeProtocol {
    var mustBeSettable: Int {get set}
    var doesNotNeedToBeSattable: Int {get}
}

protocol AnotherProtocol {
    static var someTypeProperty: Int {get set}
}

protocol FullNamed {
    var fullNane: String {get}
}

struct Person: FullNamed {
    var fullNane: String
}

let john52 = Person(fullNane: "John")
print(john52.fullNane)

class Starship: FullNamed {
    var prefix: String?
    var name: String

    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }

    var fullNane: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullNane)

// урок 53 - Требование методов
print("\nурок 53")
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0

    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator1 = LinearCongruentialGenerator()
print("Случайное число: \(generator1.random())")
print("И еще одно: \(generator1.random())")

// урок 54 - Требование изменяющих методов
print("\nурок 54")
protocol Toggable {
    mutating func toggle()
}

enum OnOffSwitch: Toggable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
print(lightSwitch)

// урок 55 - Требование инициализатора
print("\nурок 55")
protocol SomeProtocol55 {
    init()
}

class SomeSuperClass55 {
    init() {
        //
    }
}

class SomeSubClass: SomeSuperClass55, SomeProtocol55 {
    required override init() {
        //
    }
}

// урок 56 - Протоколы как типы
print("\nурок 56")
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }

    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Бросок игральной кости: \(d6.roll())")
}

// урок 57 - Делегирование
print("\nурок 57")
protocol DiceGame {
    var dice: Dice {get}
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStarNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakeAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]

    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }

    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStarNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
                case finalSquare:
                    break gameLoop
                case let newSquare where newSquare > finalSquare:
                    continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0

    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakeAndLadders {
            print("Начални новую игру \"Змеи и лестницы\"")
        }
        print("У игральной кости \(game.dice.sides) граней")
    }

    func game(_ game: DiceGame, didStarNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Выкинули \(diceRoll)")
    }

    func gameDidEnd(_ game: DiceGame) {
        print("Длительность игры \(numberOfTurns) хода(ов)")
    }
}

let tracker = DiceGameTracker()
let game = SnakeAndLadders()
game.delegate = tracker
game.play()

// урок 58 - Добавление реализации протокола через расширение
print("\nурок 58")
protocol TextRepresentable {
    func textualDescrption() -> String
}

extension Dice: TextRepresentable {
    func textualDescrption() -> String {
        return "Игральная кость с \(sides) гранями"
    }
}

let d10 = Dice(sides: 10, generator: LinearCongruentialGenerator())
print(d10.textualDescrption())

extension SnakeAndLadders: TextRepresentable {
    func textualDescrption() -> String {
        return "Игра Змеи и Лестницы с полем в \(finalSquare) клеток"
    }
}
print(game.textualDescrption())

struct Hamster {
    var name: String
    func textualDescription() -> String {
        return "Хомяка назвали \(name)"
    }
}

extension Hamster: TextRepresentable {
    func textualDescrption() -> String {
        return "Хомяка назвали \(name)"
    }
}

let simonTheHamster = Hamster(name: "Фруша")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescrption())

let things58: [TextRepresentable] = [game, d10, simonTheHamster]

// урок 59 - Коллекция типов и наследование протокола
print("\nурок 59")
for thing in things58 {
    print(thing.textualDescrption())
}

protocol PrettyTextRepresentable {
    var prettyTextulDecription: String {get}
}

extension SnakeAndLadders: PrettyTextRepresentable {
    var prettyTextulDecription: String {
        var output = textualDescrption() + ":\n"

        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "🔺 "
            case let ladder where ladder < 0:
                output += "🔻 "
            default:
                output += "🔴 "
            }
        }
        return output
    }
}

print(game.prettyTextulDecription)

// урок 60 - Классовые протоколы и композиция протоколов
print("\nурок 60")
protocol Named {
    var name: String {get}
}

protocol Aged {
    var age: Int {get}
}

struct VipPerson: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirsday(to celebrator: Named & Aged) {
    print("С Днем рождения, \(celebrator.name)! Тебе уже \(celebrator.age)!")
}

let birsdayPerson = VipPerson(name: "Сашка", age: 21)
wishHappyBirsday(to: birsdayPerson)

class Location {
    var latitude: Double
    var longitude: Double
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City60: Location, Named {
    var name: String
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location: Location & Named) {
    print("Hello. \(location.name)!")
}

let seatle = City60(name: "Seatle", latitude: 47.6, longitude:  -122.3)
beginConcert(in: seatle)

// урок 61 - Проверка соответствия протоколу
print("\nурок 61")
protocol HasArea {
    var area: Double {get}
}

class Circle: HasArea {
    let pi = 3.1215927
    var radius: Double
    var area: Double { return pi * radius * radius}

    init(radius: Double) {
        self.radius = radius
    }
}

class Country61: HasArea {
    var area: Double

    init(area: Double) {
        self.area = area
    }
}

class Animal61 {
    var  legs: Int

    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country61(area: 243610),
    Animal61(legs: 4)]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Площадь равна \(objectWithArea.area)")
    } else {
        print("Что-то такое, что не имеет площади")
    }
}

// урок 62 - Опциональные требования протокола
print("\nурок 62")
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int {get}
}

class Counter62 {
    var count = 0
    var dataSource: CounterDataSource?

    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}

var counter62 = Counter62()
counter62.dataSource = ThreeSource()

for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter62.count = -4
counter62.dataSource = TowardsZeroSource()

for _ in 1...5 {
    counter62.increment()
    print(counter62.count)
}

// урок 63 - Расширения протоколов
print("\nурок 63")
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generatorBool = LinearCongruentialGenerator()
print("Рандомное число \(generatorBool.random())")
print("Рандомное логическое значение \(generatorBool.randomBool())")

//extension PrettyTextRepresentable {
//    var prettyTextDescpiption: String {
//        return textualDescrption()
//    }
//}

extension Collection where Iterator.Element: TextRepresentable {
    func textualDescrption() -> String {
        let itemsAsText = self.map {$0.textualDescrption()}
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]

print(hamsters.textualDescrption())

// урок 64 - Универсальные функции
print("\nурок 64")
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tmpA = a
    a = b
    b = tmpA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt = \(someInt), anotherInt = \(anotherInt)")

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let tmpA = a
    a = b
    b = tmpA
}

var someNewInt = 3
var anotherNewInt = 107
swapTwoInts(&someNewInt, &anotherNewInt)
print("someNewInt = \(someNewInt), anotherNewInt = \(anotherNewInt)")

// урок 65 - Параметры типа
print("\nурок 65")

// урок 66 - Универсальные типы
print("\nурок 66")
struct IntStack66 {
    var items = [Int]()

    mutating func push(_ item: Int) {
        items.append(item)
    }

    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack66<Element> {
    var items = [Element]()

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfString = Stack66<String>()
stackOfString.push("uno")
stackOfString.push("dos")
stackOfString.push("tres")
stackOfString.push("cuatro")

print(stackOfString)

let fronTheTop = stackOfString.pop()

print(stackOfString)
print(fronTheTop)

// урок 67 - Расширяем универсальный тип
print("\nурок 67")
extension Stack66 {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfString.topItem {
    print("Верхний элемент стека - \(topItem)")
}

// урок 68 - Ограничения типа
print("\nурок 68")
//func someFunction<T: SomeClass, u: SomeProtocol>(someT: T, someU: U) {}
func findIndex<T: Equatable>(ofString valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("Индекс ламы - \(foundIndex)")
}

let doubleIndex = findIndex(ofString: 9.3, in: [3.1415, 0.1, 0.25])
let intIndex = findIndex(ofString: 2, in: [1, 2, 3])

// урок 69 - Связанные типы
print("\nурок 69")
protocol Container {
    associatedtype Item//: Equatable
    mutating func append(_ item: Item)
    var count: Int {get}
    subscript(i: Int) -> Item {get}
    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
    func makeIterator() -> Iterator
}

struct IntStack: Container {
    var items = [Int]()

    mutating func push(_ item: Int) {
        items.append(item)
    }

    mutating func pop() -> Int {
        return items.removeLast()
    }

    //typealias Item = Int

    mutating func append(_ item: Int) {
        self.push(item)
    }

    var count: Int {
        return items.count
    }

    subscript(i: Int) -> Int {
        return items[i]
    }

    func makeIterator() -> Array<Int>.Iterator {
        return Array<Int>.Iterator(_elements: items)
    }
}

struct Stack<Element>: Container {
    var items = [Element]()

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }

    mutating func append(_ item: Element) {
        self.push(item)
    }

    var count: Int {
        return items.count
    }

    subscript(i: Int) -> Element {
        return items[i]
    }

    func makeIterator() -> Array<Element>.Iterator {
        return Array<Element>.Iterator(_elements: items)
    }
}

extension Array: Container {}

// урок 70 - Оговорка where
print("\nурок 70")
func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool
    where C1.Item == C2.Item, C1.Item: Equatable {
        print("\(someContainer), \(anotherContainer)")
        // Проверяем одинаковое ли количество элементов находится в контейнерах
        print("\(someContainer.count), \(anotherContainer.count)")
        if someContainer.count != anotherContainer.count {
            return false
        }

        // Проверяем все ли значения попарно равны
        for i in 0..<someContainer.count {
            if  someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        return true
}

var arrayOfString2 = ["uno", "dos", "tres"]
var stackOfString2 = ["uno", "dos", "tres"]

if allItemsMatch(stackOfString2, arrayOfString2) {
    print("Все элементы совпадают")
} else {
    print("Не все элементы совпадают")
}

// урок 71 - Расширения с оговоркой where
print("\nурок 71")
extension Stack where Element: Equatable {
    func isPop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}

var stackOfString3 = Stack<String>()
stackOfString.push("uno")
stackOfString.push("dos")
stackOfString.push("tres")

if stackOfString3.isPop("tres") {
    print("Верхний элемент tress")
} else {
    print("Верхний элемент что-то еще")
}
struct NotEquatable {}

var NotEquatableStack = Stack<NotEquatable>()
let NotEquatableValue = NotEquatable()
NotEquatableStack.push(NotEquatableValue)
//NotEquatableStack.isTop(NotEquatableValue)

extension Container where Item: Equatable {
    func startWith (_ item: Item) -> Bool {
        return count > 0 && self[0] == item
    }
}

if [9, 9, 9].startWith(42) {
    print("Начинается с 42")
} else {
    print("Начинается с чето-то еще")
}

extension Container where Item == Double {
    func average() -> Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
    return sum / Double(count)
    }
}

print([1260.0, 1200.0, 98.6, 37.0].average())

// урок 72 - Связанные типы с универсальной оговоркой where
print("\nурок 72")
protocol ComparableContainer: Container where Item: Comparable {}

extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item]
    where Indices.Iterator.Element == Int {
        var result = [Item]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}

// урок 73 - Контроль доступа
print("\nурок 73")
//open          - доступ из других модулей
//public        - доступ к публичным объектам других модулей
//internal      - доступ внутри модуля
//fileprivate   - доступ к свойствам и методам внутри класса
//private       - доступ к свойствам и методам внутри класса ограничен

// урок 74 - Побитовые операторы и сдвиги
print("\nурок 74")

// ~ инвертирует значение
let initialBits: UInt8 = 0b00001111
let invertBits: UInt8 = ~initialBits

// & знак И
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits
print(String(middleFourBits, radix: 2))

// | знак ИЛИ
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinesBits = someBits | moreBits
print(String(combinesBits, radix: 2))

// ^ знак +
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits
print(String(outputBits, radix: 2))

// >>, <<
let shiftBits: UInt8 = 4 // 0b00000100
shiftBits << 1
shiftBits << 2
shiftBits << 5
shiftBits << 6
shiftBits >> 2

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16
let greenComponent = (pink & 0x00FF00) >> 8
let blueComponent = pink & 0x0000FF

let minusFour: Int8 = -4 // 2^7 - 4 = 124
print(String(124, radix: 2))

// урок 75 - Операторы переполнения
print("\nурок 75")
var potentialOverflow = Int16.max
// potentialOverflow += 1

var willOverflow = Int8.max
willOverflow = willOverflow &+ 1

var usignedOverflow = Int8.min
willOverflow = willOverflow &- 1

var signedUnderFlow = Int8.min
willOverflow = willOverflow &- 1

// урок 76 - Приоритет и ассоциативность
print("\nурок 76")
2 + 3 % 4 * 5
2 + ((3 % 4) * 5)

// урок 77 - Операторные функции
print("\nурок 77")
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

extension Vector2D {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    static func != (left: Vector2D, right: Vector2D) -> Bool {
        return !(left == right)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anothetTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anothetTwoThree {
    print("Эти два вектора одинаковы")
}

// урок 78 - Пользовательские операторы
print("\nурок 78")
prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
print("toBeDoubled = \(toBeDoubled), afterDoubling = \(afterDoubling)")

infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.y, y: left.y - right.x)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector


// задания по теме ООП Swift
// задание 1
print("\nзадание 1")
/* Вычисляемые свойства:
Сделать структуру. В ней будет 2 свойства радиус и площадь. Площадь должна рассчитываться автоматически. При изменении площади радиус должен перерассчитываться. */
struct CircleHW1 {
    var radius = 0.0
    var square: Double {
        get {
            return 3.14 * radius * radius
        }
        set {
            self.radius = sqrt(newValue / 3.14)
        }
    }
}

var circle = CircleHW1(radius: 2)
circle.radius
circle.square

circle.square = 12.56
circle.radius
circle.square

// задание 2
print("\nзадание 2")
/* Построить три класса (базовый и 2 потомка), описывающих некоторых работников с почасовой оплатой (один из потомков) и фиксированной оплатой (второй потомок). Описать в базовом классе свойство name и метод для расчета среднемесячной заработной платы, который возвращает 0. Для «повременщиков» формула для расчета такова: «среднемесячная заработная плата = 20.8 * 8 * почасовую ставку», для работников с фиксированной оплатой «среднемесячная заработная плата = фиксированной месячной оплате». В классах потомках сделать инициализатор имени и ставки. А из инициализатора из родительского класса сделать вспомогательный инициализатор. В случае инициализации с помощью вспомогательного инициализатора часовую ставку сделать = 1000, а фиксированную ставку = 50_000. */
class Worker {
    var name: String

    func calculateSalary() -> Double {
        return 0.0
    }

    init(name: String) {
        self.name = name
    }

    convenience init() {
        self.init(name: "worker")
    }
}

class Builder: Worker {
    var averageMonthlyPayment: Double {
        calculateSalary()
    }
    var salaryPerHour: Double

    override func calculateSalary() -> Double {
        return 20.8 * 8 * self.salaryPerHour
    }

    init(name: String, salaryPerHour: Double) {
        self.salaryPerHour = salaryPerHour
        super.init(name: name)
    }

    convenience override init(name: String) {
        self.init(name: name, salaryPerHour: 1000)
    }
}

class Engineer: Builder {
    var fixedMonthlyPayment: Double

    override func calculateSalary() -> Double {
        return fixedMonthlyPayment
    }

    init(name: String, fixedMonthlyPayment: Double) {
        self.fixedMonthlyPayment = fixedMonthlyPayment
        super.init(name: name, salaryPerHour: 0)
    }

    convenience init(name: String) {
        self.init(name: name, fixedMonthlyPayment: 50_000)
    }
}

let builder1 = Builder(name: "builder", salaryPerHour: 10)
let engineer1 = Engineer(name: "engineer", fixedMonthlyPayment: 2000)

builder1.name
builder1.averageMonthlyPayment

engineer1.name
engineer1.averageMonthlyPayment

let builder2 = Builder(name: "builder")
let engineer2 = Engineer(name: "engineer")

builder2.name
builder2.averageMonthlyPayment

engineer2.name
engineer2.averageMonthlyPayment

// задание 3
print("\nзадание 3")
/* Приведение типов: Сделать класс Учащийся. У него должны быть свойства: Имя, Возраст, Учебное заведение
Сделать 2 класса потомка (Ученик и Студент). У них должно быть одноименное свойство Название учебного заведения. Одноименный метод (вычисляемое свойство) для получения класса или курса в зависимости от возраста. Ученики идут в школу в 7 лет. В институт в 17.
Сделать вычисляемое свойство description в классе Учащийся, которое выводит класс или курс (6 класс, 3 курс).
Сделать массив для тестирования из учеников и студентов, и вывести его состав. Название учебного заведения выводить там, где оно есть. */
enum Building: String {
    case school = "Ученик"
    case institute = "Студент"
    case unknown
}

class Student {
    var name: String
    var age: UInt
    var institution: Building

    init(name: String, age: UInt, institution: Building) {
        self.name = name
        self.age = age
        self.institution = institution
    }

    func description() -> String {
        switch age {
        case 7...16:
            return "\(age - 6) класс"
        case 17...:
            let course: UInt
            if (age - 16) > 4 {
                course = 5
            } else {
                course = age - 16
            }
            return "\(course) курс"
        default:
            return "ходит в садик"
        }
    }
}

class Schoolboy: Student {
    var nameInstitution: String?

    init(name: String, age: UInt, institution: Building, nameInstitution: String?) {
        if let tmp = nameInstitution {
            self.nameInstitution = tmp
        } else {
            self.nameInstitution = nil
        }
        super.init(name: name, age: age, institution: institution)
    }

    func institution() {
        if age > 6 && age < 17 {
            self.institution = .school
        } else if age > 16 {
            self.institution = .institute
        }
    }
}

class Studentboy: Student {
    var nameInstitution: String?

    init(name: String, age: UInt, institution: Building, nameInstitution: String?) {
        if let tmp = nameInstitution {
            self.nameInstitution = tmp
        } else {
            self.nameInstitution = nil
        }
        super.init(name: name, age: age, institution: institution)
    }

    func institution() {
        if age > 6 && age < 17 {
            self.institution = .school
        } else if age > 16 {
            self.institution = .institute
        }
    }
}

var students = [
    Studentboy(name: "Гарри", age: 17, institution: .unknown, nameInstitution: "КузГТУ"),
    Schoolboy(name: "Дима", age: 7, institution: .unknown, nameInstitution: "Школе №99"),
    Studentboy(name: "Рон", age: 18, institution: .unknown, nameInstitution: "КузГТУ"),
    Schoolboy(name: "Олег", age: 8, institution: .unknown, nameInstitution: "Школе №99"),
    Studentboy(name: "Сергей", age: 19, institution: .unknown, nameInstitution: nil),
    Schoolboy(name: "Артем", age: 9, institution: .unknown, nameInstitution: nil)]

for student in students {
    if let stud = student as? Schoolboy {
        stud.institution()
        if let tmp = stud.nameInstitution {
            print("\(stud.institution.rawValue) \(stud.name), возраст: \(stud.age) лет, учится в \(tmp), \(stud.description())")
        } else {
            print("\(stud.institution.rawValue) \(stud.name), возраст: \(stud.age) лет, \(stud.description())")
        }

    } else if let stud = student as? Studentboy {
        stud.institution()
        if let tmp = stud.nameInstitution {
            print("\(stud.institution.rawValue) \(stud.name), возраст: \(stud.age) лет, учится в \(tmp), \(stud.description())")
        } else {
            print("\(stud.institution.rawValue) \(stud.name), возраст: \(stud.age) лет, \(stud.description())")
        }
    }
}

// задание 4
print("\nзадание 4")
/* Класс Банкомат. Методы: Выдать, Принять. Свойство: Наличность. Если денег не хватает, то генерировать ошибку. Если при приеме денег в пачке больше 100 000, то тоже генерировать ошибку и соответственно их обрабатывать.
Класс Персона. Есть ссылка на кредитную карту. Свойство: Наличность.
Класс Кредитная карта. Свойство: Безнал. Есть ссылка на владельца.
У персоны может и не быть кредитной карты. При попытке снять или положить деньги должно выводиться сообщение.
Необходимо сделать проверку достаточно ли средств на кредитной карте.
При обнулении (=nil) клиента, его кредитная карта должна освобождать память. */
enum BankomatError: Error {
    case notEnoughMoney(money: UInt)
    case moneyOver100
    case noCreditCard
}

class Bankomat {
    let name: String
    var moneyDeposit: UInt = 0

    init(name: String) {
        self.name = name
    }

    // выдать
    func extradite(persona: PersonaCreditCard?, money: UInt) throws {
        if let card = persona?.creditCard {
            if money <= moneyDeposit {
                moneyDeposit -= money
                print("Выдано из банкомата: \(money) рублей. Карта № \(card.number)")
            } else {
                throw BankomatError.notEnoughMoney(money: money - moneyDeposit)
            }
        } else {
            throw BankomatError.noCreditCard
        }
    }

    // принять
    func accept(persona: PersonaCreditCard?, money: UInt) throws {
        if let card = persona?.creditCard {
            if money > 100_000 {
                throw BankomatError.moneyOver100
            } else {
                moneyDeposit += money
                print("Принято в банкомат: \(money) рублей. Карта № \(card.number)")
            }
        } else {
            throw BankomatError.noCreditCard
        }
    }
}

class PersonaCreditCard {
    let name: String
    var creditCard: CreditCardPersona?
    var moneyDeposit: UInt = 0

    init(name: String) {
        self.name = name
    }

    deinit {
        print("Клиент \(name) деанициализируется")
    }
}

class CreditCardPersona {
    let number: UInt
    var bankTransfer: UInt = 0
    unowned let persona: PersonaCreditCard

    init(number: UInt, persona: PersonaCreditCard) {
        self.number = number
        self.persona = persona
    }

    deinit {
        print("Карта #\(number) деинициализируется")
    }
}

var scroogeMcDuck: PersonaCreditCard?
scroogeMcDuck = PersonaCreditCard(name: "Scrooge McDuck")

var bankomat = Bankomat(name: "Банкомат на ВДНХ")
bankomat.moneyDeposit = 80_000

// выдать
func extradite(persona: PersonaCreditCard?, bankomat: Bankomat, money: UInt) throws {
    try bankomat.extradite(persona: persona, money: money)
}

// принять
func accept(persona: PersonaCreditCard?, bankomat: Bankomat, money: UInt) throws {
    try bankomat.accept(persona: persona, money: money)
}

func tryMoneyExtradite(persona: PersonaCreditCard?, bankomat: Bankomat, money: UInt) throws {
    do {
        try extradite(persona: scroogeMcDuck, bankomat: bankomat, money: money)
    } catch BankomatError.noCreditCard {
        print("Нет кредитной карты")
    }  catch BankomatError.notEnoughMoney(money: let money) {
        print("В банкомате не достаточно средств. Можно снять \(money) рублей")
    }
}

func tryMoneyAccept(persona: PersonaCreditCard?, bankomat: Bankomat, money: UInt) throws {
    do {
        try accept(persona: scroogeMcDuck, bankomat: bankomat, money: money)
    } catch BankomatError.noCreditCard {
        print("Нет кредитной карты")
    } catch BankomatError.moneyOver100 {
        print("Банкомат не может принять более 100 000 рублей")
    }
}

try tryMoneyExtradite(persona: scroogeMcDuck, bankomat: bankomat, money: 10_000)
try tryMoneyAccept(persona: scroogeMcDuck, bankomat: bankomat, money: 10_000)

scroogeMcDuck?.creditCard = CreditCardPersona(number: 123454321, persona: scroogeMcDuck!)
scroogeMcDuck?.moneyDeposit = 1_000_000_000

try tryMoneyExtradite(persona: scroogeMcDuck, bankomat: bankomat, money: 70_000)
try tryMoneyExtradite(persona: scroogeMcDuck, bankomat: bankomat, money: 20_000)

try tryMoneyAccept(persona: scroogeMcDuck, bankomat: bankomat, money: 100_001)
try tryMoneyAccept(persona: scroogeMcDuck, bankomat: bankomat, money: 100_000)

scroogeMcDuck = nil

// задание 5
print("\nзадание 5")
///* Сделать класс Vector2D (x, y) и Vector3D (x, y, z)
//a. Написать протокол c 2-мя методами:
//   i. vectorLength() -> Double,
//   ii. printComponets() -> Void
//b. Подписать классы данным протоколом
//c. Создать массив из векторов 2D и 3D
//d. В цикле вывести компоненты вектора и его длину. */



//struct Vector22D {
//    var x = 0.0, y = 0.0
//}

class Vector1D {
    var x, y: Double

    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

class Vector3D {
    var x, y, z: Double

    init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }
}

protocol VectorD {
    func vectorLength() -> Double
    func printComponets() -> Void
}


extension Vector1D: VectorD {
    func vectorLength() -> Double {
        return sqrt(x * x + y * y)
    }

    func printComponets() {
        print("x = \(x), y = \(y)")
    }
}

extension Vector3D: VectorD {
    func vectorLength() -> Double {
        return sqrt(x * x + y * y + z * z)
    }

    func printComponets() {
        print("x = \(x), y = \(y), z = \(z)")
    }
}

let arrayVector1D = [
    Vector1D(x: 1, y: 2),
    Vector1D(x: 3, y: 4),
    Vector1D(x: 5, y: 6)]

let arrayVector3D = [
    Vector3D(x: 1, y: 2, z: 3),
    Vector3D(x: 4, y: 5, z: 6),
    Vector3D(x: 7, y: 8, z: 9)]

for arrayVector in arrayVector1D {
    print("\nВектор с параметрами:")
    arrayVector.printComponets()
    print("Длина вектора составляет \(arrayVector.vectorLength()) ")
}

for arrayVector in arrayVector3D {
    print("\nВектор с параметрами:")
    arrayVector.printComponets()
    print("Длина вектора составляет \(arrayVector.vectorLength()) ")
}

print()
