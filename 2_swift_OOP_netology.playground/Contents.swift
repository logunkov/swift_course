// Swift ООП

// Основы ООП
print("Основы ООП")
/*
Задача 1
Для каждого принципа ООП приведите 2-3 примера из жизни:
 * Абстракция
 * Инкапсуляция
 * Наследование
 * Полиморфизм

Задача 2
Для каждого базового понятия ООП приведите 2-3 примера из жизни. Опишите их текстом:
 * Класс
 * Объект
 * Свойства объектов
 * Методы
*/
// задача №1*

// пример №1
// Абстракция
struct Gun {
    let weight: UInt
    let caliber: UInt
    var magazineCapacity: UInt
}

// Инкапсуляция
class Glock {
    var gun = Gun(weight: 600, caliber: 9, magazineCapacity: 17)
    func shoot() {
        print("пиу-пиу")
    }
    func recharge() {
        print("новая обойма")
    }
}

// Наследование
class Glock17: Glock {
    var haveFlashlight = true
}

// Полиморфизм
class DesertEagle: Glock {
    override func shoot() {
        print("бах-бах")
    }
    override func recharge() {
        print("ооо..да... новая обойма")
    }
}

// пример №2
// Абстракция
struct Сhild {
    var weight: UInt
    var growth: UInt
}

// Инкапсуляция
class Workman {
    func work() {
        print("делать работу")
    }
    func rest() {
        print("лежать на диване")
    }
}

// Наследование
class GoodWorkman: Workman {
    func hardWork() {
        print("усердно работать")
    }
}

// Полиморфизм
class Gardener: Workman {
    override func work() {
        print("постригать кусты")
    }
    override func rest() {
        print("лежать на под деревом")
    }
}

// задача №2*

// пример №1
// Класс
class Music {

}

// Объект
let music = Music()

// Свойства объектов
class MusicColumn {
    var volume = 0
    let height = 100
    let width = 50
    let depth = 20
}

// Методы
class MusicColumnJBL {
    func playMusic(){
        print("play music Rammstain")
    }
}

// пример №2
// Класс
class CoffeeMachine {

}

// Объект
let coffeeMachine = CoffeeMachine()


// Свойства объектов
class Cup {
    let volume = 500
    let color = "black"
}

// Методы
class MyCup {
    func waterHeating() {
        print("нагреваю воду в кружке")
    }
}

// Объекты в ООП
print("\nОбъекты в ООП")
/*
Задача 1
Придумайте именованные типы Swift, подбирая лучшие абстракции. Объявите свойства и методы в них. Статический анализатор подскажет, если вы забудете кое-что (‘Type annotation missing…’). На предупреждения о том, что в enum нельзя объявлять хранимые свойства и на необходимость инициализаторов в class, пока не обращайте внимания.
Пример:
 * Дни недели - конечное число, подходит перечисление enum
 * Любая анкета - форма с данными, подходит struct
 * Абстракция “летчик” содержит свойства и методы, будет учиться и повышать квалификацию (меняться), увеличивать налет = class

Задача 2
Напишите по 2 примера композиции и агрегации из реального мира, без использования кода. Каждому примеру дайте объяснения почему это композиция или агрегация.
*/
// задача №1
// enum
enum RussianHolidays {
    case NewYearHolidays
    case nativity
    case defenderOfTheFatherlandDay
    case internationalWomenDay
    case springAndLabourDay
    case victoryDay
    case russiaDay
    case nationalUnityDay
}

// struct
struct GunG17 {
    var weight: UInt
    var aimingRange: UInt
    var muzzleVelocity: UInt
    var combatRateOfFire: UInt
    var magazineCapacity: UInt
}

// class
class Game {
    var name: String
    var level = 1
    let maxLevel = 50
    var nextLevel = false
    init(name: String) {
        self.name = name
    }
    func next(nextLevel: Bool) {
        if nextLevel {
            level += 1
        }
    }
    func gameOver() {
        if level >= 50 {
            print("Game Over")
        }
    }
}

// задача №2*

// пример 1
// композиция - сильная ассоциация / связь
/*
Писатель Джон Рональд Руэл Толкин  и его произведения: "Хоббит", "Властелин колец".
Если бы данного писателя убили во время первой мировой войны, тогда бы он не написал эти произведения.
*/

// агрегация - слабая ассоциация / связь
/*
В моей библиотеке есть произведения писателя Джона Рональда Руэле Толкина - "Хоббит" и "Властелин колец".
И если при переезде, я полностью потеряю свою библиотеку, данные книги не пропадут, т.к. в мире останутся другие экземпляры этих книг.
*/

// пример 2
// композиция - сильная ассоциация / связь
/*
Мне очень нравятся напики фирмы Pepsi, и с уходом данной компании из РФ - больше не смогу купить данные напитки в РФ.
*/

// агрегация - слабая ассоциация / связь
/*
Но у нас есть импортозамещение, и такие фирмы как "Добрый", "Черноголовка" и т.д.
Они производят напитки похожие на пепси, тем самым я могу пить газировку напоминаюшую Pepsi. Но все же это не пепси, а другие напитки.
 */


// ООП: Интерфейс и реализация. Переопределение методов
print("\nООП: Интерфейс и реализация. Переопределение методов")
/*
Задача 1
Возьмите любой пример из жизни (класс) и опишите уровни доступа к нему. Постарайтесь описать как публичные, так и закрытые уровни и методы. Для решения задачи можно взять класс из предыдущего домашнего задания.
Пример:
 * Класс: такси
 * Имеет публичный доступ, так как любой может воспользоваться отдельным экземпляром (объектом) такси.
 * Пример геттера: узнать цену поездки
 * Пример сеттера: установить конечную точку маршрута
 * Пример публичного метода: заказать такси к определенному месту
 * Пример приватного метода: доехать до клиента

Задача 2
Создайте класс.
Создайте 3 метода с одинаковым названием, но разными сигнатурами. Статический анализатор Swift подскажет вам, если overload не получится ;)

Задача 3*
Создайте класс-родитель. Определите в нем метод.
Создайте класс-наследник. Переопределите в нем метод родителя, но с вызовом родительского метода.
*/
// задача №1
/*
 Класс: фрукт
 Имеет публичный доступ, так как любой может купить его в продуктовом магазине
 Пример геттера: цена за 1 кг
 Пример сеттера: указать вес фруктов для покупки
 Пример публичного метода: получить информацию, чем полезен данный фрукт
 Пример приватного метода: узнать себестоимость фруктов
*/

// задача №2
class Salary {
    var balance = 0
    func calculateSalary() {
        balance += 1000
    }
    func calculateSalary(premium: Int) {
        balance += premium
    }
    func calculateSalary(materialAid: Bool) {
        if materialAid {
            balance += 500
        }
    }
}

var salary = Salary()
salary.balance
salary.calculateSalary()
salary.calculateSalary(premium: 5000)
salary.calculateSalary(materialAid: false)
salary.balance

// задача №3*
class Schoolboy {
    func study() {
        print("- учебное заведение")
    }
}

class Student: Schoolboy {
    override func study() {
        super.study()
        print("- библиотеку")
    }
}

let schoolboy = Schoolboy()
print("Школьник посещает:")
schoolboy.study()

let student = Student()
print("Студент посещает:")
student.study()

// Классы и структуры
print("\nКлассы и структуры")
/*
Задача 1
Представьте себя инженером проектировщиком телевизоров во времена, когда эпоха телевещания только набирала обороты. Вам поступила задача создать устройство для просмотра эфира в домашних условиях “Телевизор в каждую семью”.
Вам нужно реализовать перечисление (enum) “Телевизионный канал” с 5-7 каналами.
Алгоритм выполнения:
 * Реализуйте класс “Телевизор”. У него должны быть состояния:
 ** фирма/модель (реализовать одним полем. Подумайте какой тип данных подойдет?);
 ** включен/выключен;
 ** текущий телеканал;
 * У него должно быть поведение:
 ** показать, что сейчас по телеку
 * Вызовите метод и покажите, что сейчас по телеку.
 * Сделайте изменение состояний телевизора (на свой выбор).
 * Повторите вызов метода и покажите, что сейчас по телеку.

Задача 2
Время идет, рынок и потребители развиваются, и ваша компания набирает ритм. Поступают все новые и новые требования к эволюции устройств. Перед вами снова инженерная задача — обеспечить пользователей практичным устройством.
Алгоритм выполнения:
 * Создайте новый класс Телевизор (с другим названием класса), который будет уметь все, что и предыдущий.
 * Реализуйте структуру настроек (struct):
 громкость от 0 до 1, то есть могут быть промежуточные значения. (подумайте, какой тип использовать); показывать цветом или черно-белым (подумайте, какой тип данных лучше всего использовать).
 * Интегрируйте Настройки в новый класс Телевизор.
 * Переопределите метод “что сейчас по телеку” из класса родителя. Вызовите метод и покажите, что сейчас идет по телевизору, учитывая настройки.

Задача 3*
Порог новой эры пройден. Теперь не только есть радиоволна, но и видеомагнитофоны. Эту технику подключают проводами к телевизору и смотрят в записи свои любимые фильмы. Вам, как ведущему инженеру, срочно нужно адаптировать продукт вашей компании, потому как спрос на устаревший вариант резко пошел вниз.
Алгоритм выполнения:
 * Создайте перечисление со связанными значениями с двумя кейсами: телеканал и подключение по входящему видео порту;
 * Интегрируйте эту опцию в Телевизор.
 * Вызовите метод и покажите, что сейчас по телевизору.
*/
// задача №1
print("Задача №1")
enum TvChannel: String {
    case firstChannel = "Первый"
    case russia = "Росия"
    case tv3 = "ТВ3"
    case rentv = "Рен-ТВ"
    case ntv = "НТВ"
    case sts = "СТС"
    case tnt = "ТНТ"
}

class TV {
    let info: (firm: String, model: String)
    var included: Bool
    var channel: TvChannel

    func showWhatOnTV() {
        if included {
            print("Сейчас по телевизору показывает канал \"\(channel.rawValue)\"")
        } else {
            print("Телевизор выключен")
        }
    }

    init(info: (String, String), included: Bool, channel: TvChannel) {
        self.info = info
        self.included = included
        self.channel = channel
    }
}

var tvHall = TV(info: ("sony", "XE7005"), included: true, channel: .tnt)

tvHall.showWhatOnTV()
print()
tvHall.included = false
tvHall.showWhatOnTV()

// задача №2
print("\nЗадача №2")
enum Volume: Double {
    case lvl0 = 0.00
    case lvl1 = 0.25
    case lvl2 = 0.50
    case lvl3 = 0.75
    case lvl4 = 1.00
}

enum Color2: String {
    case blackWhite = "черно-белое"
    case colored = "цветное"
}

struct Setting {
    var volume: Volume
    var color: Color2
}

class TVColor: TV {
    var setting: Setting

    init(info: (String, String), included: Bool, channel: TvChannel, volume: Volume, color: Color2){
        setting = Setting(volume: volume, color: color)
        super.init(info: info, included: included, channel: channel)
    }

    override func showWhatOnTV() {
        super.showWhatOnTV()
        if self.included {
            print("Изображение \(self.setting.color.rawValue), громкость звука: \(self.setting.volume.rawValue)")
        }
    }
}

var tvKitchen = TVColor(info: ("sony", "XE8005"), included: true, channel: .firstChannel, volume: .lvl1, color: .blackWhite)

tvKitchen.showWhatOnTV()
print()
tvKitchen.setting.color = .colored
tvKitchen.showWhatOnTV()
print()
tvKitchen.included = false
tvKitchen.showWhatOnTV()

// задача №3*
print("\nЗадача №3*")
enum TVInput: String {
    case antenna = "телеканал"
    case recorder = "подключение по входящему видео порту"
}

class TVrecorder: TVColor {
    var tvInput: TVInput
    init(info: (String, String), included: Bool, channel: TvChannel, volume: Volume, color: Color2, tvInput: TVInput) {
        self.tvInput = tvInput
        super.init(info: info, included: included, channel: channel, volume: volume, color: color)
    }

    override func showWhatOnTV() {
        if !self.included || self.tvInput == .antenna {
            super.showWhatOnTV()
        }

        if self.included  && self.tvInput == .recorder {
            print("Сейчас по телевизору показывает видеомагнитофон")
            print("Изображение \(self.setting.color.rawValue), громкость звука: \(self.setting.volume.rawValue)")
        }
    }
}

var tvBedroom = TVrecorder(info: ("sony", "XE9005"), included: true, channel: .ntv, volume: .lvl1, color: .colored , tvInput: .antenna)
tvBedroom.showWhatOnTV()
print()
tvBedroom.tvInput = .recorder
tvBedroom.showWhatOnTV()
print()
tvBedroom.included = false
tvBedroom.showWhatOnTV()

// Свойства и методы объекта
print("\nСвойства и методы объекта")
/*
Задача 1
Представьте себя инженером проектировщиком телевизоров во времена, когда эпоха телевещания только набирала обороты. Вам поступила задача создать устройство для просмотра эфира в домашних условиях “Телевизор в каждую семью”.
Вам нужно реализовать перечисление (enum) “Телевизионный канал” с 5-7 каналами.
Алгоритм выполнения:
 * Реализуйте класс “Телевизор”. У него должны быть состояния:
 * фирма/модель (реализовать одним полем. Подумайте какой тип данных подойдет?);
 * включен/выключен;
 * текущий телеканал;
У него должно быть поведение:
 * показать, что сейчас по телеку
Вызовите метод и покажите, что сейчас по телеку.
Сделайте изменение состояний телевизора (на свой выбор).
Повторите вызов метода и покажите, что сейчас по телеку.

Задача 2
 Время идет, рынок и потребители развиваются, и ваша компания набирает ритм. Поступают все новые и новые требования к эволюции устройств. Перед вами снова инженерная задача — обеспечить пользователей практичным устройством.
Алгоритм выполнения:
 * Создайте новый класс Телевизор (с другим названием класса), который будет уметь все, что и предыдущий.
 * Реализуйте структуру настроек (struct):
 громкость от 0 до 1, то есть могут быть промежуточные значения. (подумайте, какой тип использовать); показывать цветом или черно-белым (подумайте, какой тип данных лучше всего использовать).
 * Интегрируйте Настройки в новый класс Телевизор.
 * Переопределите метод “что сейчас по телеку” из класса родителя. Вызовите метод и покажите, что сейчас идет по телевизору, учитывая настройки.

Задача 3*
Порог новой эры пройден. Теперь не только есть радиоволна, но и видеомагнитофоны. Эту технику подключают проводами к телевизору и смотрят в записи свои любимые фильмы. Вам, как ведущему инженеру, срочно нужно адаптировать продукт вашей компании, потому как спрос на устаревший вариант резко пошел вниз.
Алгоритм выполнения:
 * Создайте перечисление со связанными значениями с двумя кейсами: телеканал и подключение по входящему видео порту;
 * Интегрируйте эту опцию в Телевизор.
 * Вызовите метод и покажите, что сейчас по телевизору.
 */
// задача №1
print("Задача №1")
enum Country {
    case USA
    case Germany
}

struct Track {
    let name: String
    let artist: String
    let duration: UInt
    let country: Country
}

// Industrial metal
let industrialMetal = "Industrial metal"
let song1 = Track(name: "Ich Will", artist: "Rammstein", duration: 300, country: .Germany)
let song2 = Track(name: "Du hast", artist: "Rammstein", duration: 289, country: .Germany)
let song3 = Track(name: "Soone", artist: "Rammstein", duration: 312, country: .Germany)

// New metal
let newMetal = "New metal"
let song4 = Track(name: "Freak on a Leash", artist: "Korn", duration: 265, country: .USA)
let song5 = Track(name: "Coming Undone", artist: "Korn", duration: 279, country: .USA)
let song6 = Track(name: "Twisted Transistor", artist: "Korn", duration: 301, country: .USA)

// Rock
let rock = "Rock"
let song7 = Track(name: "Open Your Eyes", artist: "Guano Apes", duration: 299, country: .Germany)
let song8 = Track(name: "Lords of the Boards", artist: "Guano Apes", duration: 268, country: .Germany)
let song9 = Track(name: "Big in Japan", artist: "Guano Apes", duration: 278, country: .Germany)

class Category {
    var name: String
    lazy var trackList = [Track]()
    var numberOfTracks: Int  {
        trackList.count
    }

    init(name: String) {
        self.name = name
    }

    func addtrack(track: Track) {
        trackList.append(track)
        print("В категорию \"\(self.name)\" добавили трек: \(track.artist) - \(track.name)")
    }

    func deleteTracks(track: Track) {
        var haveTrack = false
        for (index, value) in trackList.enumerated() {
            if value.name == track.name && value.artist == track.artist {
                trackList.remove(at: index)
                haveTrack = true
                print("В категории \"\(self.name)\" удалили трек: \(value.artist) - \(value.name)")
            }
        }
        if !haveTrack {
            print("Нельзя удалить трек: \(track.artist) - \(track.name), т.к. его нет в категория \"\(self.name)\"")
        }
    }
}

// Industrial metal
var categoryIndustrialMetal = Category(name: industrialMetal)
categoryIndustrialMetal.addtrack(track: song1)
categoryIndustrialMetal.addtrack(track: song2)
categoryIndustrialMetal.addtrack(track: song3)

print()
categoryIndustrialMetal.deleteTracks(track: song9)
categoryIndustrialMetal.deleteTracks(track: song1)

print()
print("Category: \"\(categoryIndustrialMetal.name)\", track list:")
for track in categoryIndustrialMetal.trackList {
    print(" * \(track.artist) - \(track.name)")
}

// задача №2
print("\nЗадача №2")
var categoryNewMetal = Category(name: newMetal)
var categoryRock = Category(name: rock)

class Library {
    var name: String
    lazy var categoryList = [Category]()
    var numberOfTracks: Int  {
        categoryList.count
    }

    init(name: String) {
        self.name = name
    }

    func addCategory(сategory: Category) {
        categoryList.append(сategory)
        print("В библиотеку \"\(self.name)\" добавили категорию: \(сategory.name)")
    }

    func deleteCategory(сategory: Category) {
        var haveCategory = false
        for (index, value) in categoryList.enumerated() {
            if value.name == сategory.name {
                categoryList.remove(at: index)
                haveCategory = true
                print("В библиотеке \"\(self.name)\" удалили категорию: \(value.name)")
            }
        }
        if !haveCategory {
            print("Нельзя удалить категорию: \(сategory.name), т.к. ее нет в библиотеке \"\(self.name)\"")
        }
    }
}

var library = Library(name: "Музыка для игр")
library.addCategory(сategory: categoryIndustrialMetal)
library.addCategory(сategory: categoryNewMetal)
library.addCategory(сategory: categoryRock)

print()
var categoryCountry = Category(name: "Country")
library.deleteCategory(сategory: categoryCountry)
library.deleteCategory(сategory: categoryRock)

print()
print("Library: \"\(library.name)\", category:")
for category in library.categoryList {
    print(" * \(category.name)")
}

// задача №3*
print("\nЗадача №3*")
class NewLibrary: Library {
    func exchange(сategory1: Category, track1: Track, сategory2: Category, track2: Track) {
        var indexCategory1 = -1
        var indexTrack1 = -1
        for (index, value) in categoryList.enumerated() {
            if value.name == сategory1.name {
                indexCategory1 = index
            }
        }

        if indexCategory1 != -1 {
            for (index, value) in categoryList[indexCategory1].trackList.enumerated() {
                if value.name == track1.name && value.artist == track1.artist {
                    indexTrack1 = index
                }
            }
        }

        var indexCategory2 = -1
        var indexTrack2 = -1
        for (index, value) in categoryList.enumerated() {
            if value.name == сategory2.name {
                indexCategory2 = index
            }
        }

        if indexCategory2 != -1 {
            for (index, value) in categoryList[indexCategory2].trackList.enumerated() {
                if value.name == track2.name && value.artist == track2.artist {
                    indexTrack2 = index
                }
            }
        }

        if indexCategory1 != -1 && indexCategory2 != -1 && indexTrack1 != -1 && indexTrack2 != -1 {
            print("Обмен треками между категориями \"\(сategory1.name)\" и \"\(сategory2.name)\":")
            categoryList[indexCategory1].deleteTracks(track: track1)
            categoryList[indexCategory1].addtrack(track: track2)
            categoryList[indexCategory2].deleteTracks(track: track2)
            categoryList[indexCategory2].addtrack(track: track1)
        } else {
            print("Обмен треками между категориями \"\(сategory1.name)\" и \"\(сategory2.name)\" не возможен, т.к.:")
        }

        if indexCategory1 == -1 {
            print("Библиотека \"\(self.name)\" не содержит категорию: \(сategory1.name)")
        }

        if indexCategory2 == -1 {
            print("Библиотека \"\(self.name)\" не содержит категорию: \(сategory2.name)")
        }

        if indexTrack1 == -1 {
            print("Категория \"\(сategory1.name)\" не содержит трек: \(track1.artist) - \(track1.name)")
        }

        if indexTrack2 == -1 {
            print("Категория \"\(сategory2.name)\" не содержит трек: \(track2.artist) - \(track2.name)")
        }
    }
}

var newLibrary = NewLibrary(name: "Музыка для игры в DOOM")

// Industrial Metal
newLibrary.addCategory(сategory: categoryIndustrialMetal)
categoryIndustrialMetal.addtrack(track: song1)

// New Metal
print()
newLibrary.addCategory(сategory: categoryNewMetal)
categoryNewMetal.addtrack(track: song4)
categoryNewMetal.addtrack(track: song5)
categoryNewMetal.addtrack(track: song6)

// Rock
print()
newLibrary.addCategory(сategory: categoryRock)
categoryRock.addtrack(track: song7)
categoryRock.addtrack(track: song8)
categoryRock.addtrack(track: song9)

print("\nБибилиотека \"\(newLibrary.name)\" до обмена треками:")
for category in newLibrary.categoryList {
    print("Category: \"\(category.name)\", track list:")
    for track in category.trackList {
        print(" * \(track.artist) - \(track.name)")
    }
    print()
}

newLibrary.exchange(сategory1: categoryCountry, track1: song1, сategory2: categoryRock, track2: song9)
print()
newLibrary.exchange(сategory1: categoryRock, track1: song9, сategory2: categoryNewMetal, track2: song8)
print()
newLibrary.exchange(сategory1: categoryIndustrialMetal, track1: song1, сategory2: categoryNewMetal, track2: song4)

print("\nБибилиотека \"\(newLibrary.name)\" после обмена треками:")
for category in newLibrary.categoryList {
    print("Category: \"\(category.name)\", track list:")
    for track in category.trackList {
        print(" * \(track.artist) - \(track.name)")
    }
    print()
}

// Замыкания
print("\nЗамыкания")
/*
Задача 1
История:
Вы разрабатываете спутник для полета на Европу (спутник Юпитера). В вашей команде два ученых по космодинамике. Вы даете каждому из них задачу расcчитать количество топлива для достижения спутником цели.

Данные, которые они получают — это вес спутника и длина полета. Они должны вам предоставить свои алгоритмы расчета расхода топлива (это ваши замыкания). А вы по готовности алгоритмов делаете обработку данных и сравниваете результат (это ваша функция).

Алгоритм выполнения:
 * Написать функцию с входящим параметром — замыкание (тип указан выше). Функция должна выводить в консоль результат выполнения замыкания.
 *  Написать два замыкания (тип указан выше). Внутри должна быть математическая операция (на ваш выбор) над входящими значениями.
 * Вызвать функцию для первого замыкания и потом для второго замыкания.
 * Выполнить задание, не сокращая синтаксис языка.

Задача 2
История:
В вашем конструкторском бюро случилось ЧП и все компьютеры вышли из строя, но последние алгоритмы вы помните. Вы намерены добраться до ближайшего компьютера в соседнем селе и восстановить из своей памяти нужные данные. Ваша задача запомнить максимально краткую форму записи алгоритмов, чтобы все не смешалось в голове.
Алгоритм выполнения:
 * Представить задание 1 в сокращенном виде (см. пункт лекции “Сокращения для замыканий”).

Задача 3*
История:
Пока вы добирались до села с компьютером, вам пришла в голову мысль своего алгоритма. Вы решили использовать свою функцию для проверки гипотезы и стали набирать алгоритм прямо в ней (реализация замыкания вместо параметра).
Алгоритм выполнения:
 * Вызвать функцию из задания 1, определив ей замыкание самостоятельно (не передавая).
 * Объяснить, куда и почему исчезло ключевое слово (‘param’ - в примере) для параметра.
*/
// задача №1
print("задача №1")
var weight: UInt = 1000
var distance: UInt = 5000

func calculateFuel(distance: UInt, weight: UInt, clouse: (UInt, UInt) -> UInt) -> Void {
    print(" для полета потребуется \(clouse(distance, weight)) литров реактивного топлива")
}

func calculateBob(distance: UInt, weight: UInt) -> UInt{
    return distance + weight
}

func calculateKevin(distance: UInt, weight: UInt) -> UInt{
    return distance - weight
}

print("Ученый \"Боб\" рассчитал:")
calculateFuel(distance: distance, weight: weight, clouse: calculateBob)

print("\nУченый \"Кевин\" рассчитал:")
calculateFuel(distance: distance, weight: weight, clouse: calculateKevin)

// задача №2
print("\nзадача №2")
let fastBobResult: (UInt, UInt) -> UInt = { $0 + $1 }
let fastKevinResult: (UInt, UInt) -> UInt = { $0 - $1 }

print("Ученый \"Боб\" рассчитал:")
calculateFuel(distance: distance, weight: weight, clouse: fastBobResult)

print("\nУченый \"Кевин\" рассчитал:")
calculateFuel(distance: distance, weight: weight, clouse: fastKevinResult)

// задача №3*
print("\nзадача №3*")
print("Мой рассчет показал:")
calculateFuel(distance: distance, weight: weight) { $0 - $1 + $1 }

// Ответ на пункт 2:
// Функция example во входящих параметрах вызывает анонимную функцию, которая ничего не возвращает.
// Когда мы вызываем функцию example с фигурными скобками, срабатывает замыкание, передается ссылка на эту функцию и выполняется код данной функции

// Наследование. Переопределение
print("\nНаследование. Переопределение")
/*
Задача 1
Вы продолжаете разрабатывать библиотеку аудио треков. Сейчас будем работать над исполнителями треков.
Алгоритм выполнения:
 * Создайте суперкласс артист;
 * Определите в нем общие для артиста свойства (имя, страна, жанр);
 * Определите общие методы (написать трек и исполнить трек);
 * В реализацию метода “написать трек” добавьте вывод в консоль “Я (имя артиста) написал трек (название трека)”;
 * В реализацию метода “исполнить трек” добавьте вывод в консоль “Я (имя артиста) исполнил трек (название трека)”;
 * Создайте 3 сабкласса любых артистов и переопределите в них МЕТОДЫ суперкласса класса.

 Задача 2
Создание списка артистов.
Алгоритм выполнения:
 * Доработайте существующих артистов так, чтобы они имели уникальные для каждого из них свойства и методы.
 * Защитите этих артистов от редактирования в будущем.

Задача 3
Создайте пустой массив, чтобы потом добавить в него ваших артистов;
Добавьте созданных ранее артистов в массив;
Напишите отчет о том, что вы поняли/в чем разобрались, выполняя это задание;
Дайте оценку своему пониманию данной темы.
Данное задание поможет вам лучше понять эту тему. В процессе написания отчета вы выявите слабые и сильные места в изучении данной темы, закроете пробелы или у вас появятся новые вопросы. При возникновении вопросов можете писать в чат группы, либо в лс преподавателю в в чате учебной группы.
 */
// задание №1
print("Задание №1")

class Artist {
    let name: String
    let country: String
    let genre: String

    init(name: String, country: String, genre: String) {
        self.name = name
        self.country = country
        self.genre = genre
    }

    func writeTrack(track: String) {
        print("Я \(name) написал трек \"\(track)\"")
    }

    func performTrack(track: String) {
        print("Я \(name) исполнил трек \"\(track)\"")
    }
}

class Rammstein: Artist {
    override func writeTrack(track: String) {
        print("Посещая Россию:")
        super.writeTrack(track: track)
    }

    override func performTrack(track: String) {
        print("В столице России - Москва:")
        super.performTrack(track: track)
    }
}

class Korn: Artist {
    override func writeTrack(track: String) {
        print("Посещая Мексику:")
        super.writeTrack(track: track)
    }

    override func performTrack(track: String) {
        print("В столице Мексики - Мехико:")
        super.performTrack(track: track)
    }
}

class Slipknot: Artist {
    override func writeTrack(track: String) {
        print("Посещая Гваделупу:")
        super.writeTrack(track: track)
    }

    override func performTrack(track: String) {
        print("В столице Гваделупы - Бас-Тер:")
        super.performTrack(track: track)
    }
}

let rammstein = Rammstein(name: "Тилль Ли́ндеманн", country: "Германия", genre: "Индастриал-метал")
let korn = Korn(name: "Джонатан Дэвис", country: "США", genre: "Ню-метал")
let slipknot = Slipknot(name: "Кори Тейлор", country: "США", genre: "Ню-метал")

rammstein.writeTrack(track: "Ich Will")
rammstein.performTrack(track: "Moskau")

print()
korn.writeTrack(track: "Did My Time")
korn.performTrack(track: "Alone I Break")

print()
slipknot.writeTrack(track: "Before I Forget")
slipknot.performTrack(track: "Wait and Bleed")

// задание №2
print("\nЗадание №2")
final class NewRammstein: Rammstein {
    var numberOfPyrotechnics: UInt

    init(name: String, country: String, genre: String, numberOfPyrotechnics: UInt) {
        self.numberOfPyrotechnics = numberOfPyrotechnics
        super.init(name: name, country: country, genre: genre)
    }

    func makeFireShow() {
        print("Группа \"Rammstein\" устроиила огненное шоу на выступлении и запустили \(numberOfPyrotechnics) феерверков")
    }
}

final class NewKorn: Korn {
    var microphoneStand: String

    init(name: String, country: String, genre: String, microphoneStand: String) {
        self.microphoneStand = microphoneStand
        super.init(name: name, country: country, genre: genre)
    }

    func makeConcertWithMicrophone() {
        print("У группы \"Korn\" на концерте стоит легендарная микрофонная стойка \"\(microphoneStand)\"")
    }
}

final class NewSlipknot: Slipknot {
    var hasMask: Bool

    init(name: String, country: String, genre: String, hasMask: Bool) {
        self.hasMask = hasMask
        super.init(name: name, country: country, genre: genre)
    }

    func makeConcert() {
        if hasMask {
            print("Группа \"Slipknot\" выступает на концерте в своих масках")
        } else {
            print("Группа \"Slipknot\" выступает на концерте без масок")
        }
    }
}

var newRammstein = NewRammstein(name: "Тилль Ли́ндеманн", country: "Германия", genre: "Индастриал-метал", numberOfPyrotechnics: 1000)
newRammstein.makeFireShow()

var newKorn = NewKorn(name: "Джонатан Дэвис", country: "США", genre: "Ню-метал", microphoneStand: "The Bitch")
newKorn.makeConcertWithMicrophone()

var newSlipknot = NewSlipknot(name: "Кори Тейлор", country: "США", genre: "Ню-метал", hasMask: true)
newSlipknot.makeConcert()

// задание №3*
print("\nЗадание №3*")
var arrayArtist = [Artist]()
arrayArtist.append(newRammstein)
arrayArtist.append(newKorn)
arrayArtist.append(slipknot)

arrayArtist.forEach{
    print("Артист: \($0.name), страна: \($0.country), жанр: \($0.genre)")
}

/*
Т.к у всех артистов был общий предок "Artist", значит мы можем создать массив "Artist" и поместить в него всех его потомков
Тема на первый взгляд оказалось легкой. При выполнении данных задач вопросо не возникало.
*/

// Протоколы и расширения. Как создавать свои ошибки
print("\nПротоколы и расширения. Как создавать свои ошибки")
/*
Задача 1 (основная)

ВЫ - главный архитектор в команде разработчиков. Ваша задача - разработать программное обеспечение (ПО) для дилерских центров по продаже автомобилей. Ваша цель - создать гибкое ПО. Что это значит? Ваше ПО должно подходить для любой марки авто, должно быть расширяемым и масштабируемым в дальнейшем, чтобы ваша компания могла выпускать обновления. Задача разделена на 4 части, в каждой из них нужно самостоятельно подумать, какой тип данных передать каждому свойству для комфортной работы, а также по необходимости добавить вспомогательные методы.

Часть 1
Для начала нужно описать машину минимальным набором параметров, используя протокол.
Алгоритм выполнения:
 * Создайте протокол 'Car’
 * Добавьте в него свойства:
 ** ‘model’ (только для чтения): марка
 ** ‘color’ (только для чтения): цвет
 ** ‘buildDate’ (только для чтения): дата выпуска
 ** ‘price’ (чтение и запись): цена авто
 ** ‘accessories’ (чтение и запись): дополнительное оборудование (тонировка, сингнализация, спортивные диски)
 ** ‘isServiced’ (чтение и запись): сделана ли предпродажная подготовка. Обычно ее делают в дилерских центрах перед постановкой машины в салон.

Часть 2
По аналогии с протоколом ‘Car’, нужно описать дилерский центр минимальным набором свойств и методов, используя протокол.
Алгоритм выполнения:
 * Создайте протокол ‘Dealership’
 * Добавьте свойства:
 ** ‘name’ (только для чтения): название дилерского центра (назвать по марке машины для упрощения)
 ** ‘showroomCapacity’ (только для чтения): максимальная вместимость автосалона по количеству машин.
 ** ‘stockCars’ (массив, чтение и запись): машины, находящиеся на парковке склада. Представим, что парковка не имеет лимита по количеству машин.
 ** ‘showroomCars’ (массив, чтение и запись): машины, находящиеся в автосалоне.
 ** ‘cars’ (массив, чтение и запись): хранит список всех машин в наличии.
 * Добавьте методы:
 ** ‘offerAccesories(_ :)’: принимает массив акксесуаров в качестве параметра. Метод предлагает клиенту купить доп. оборудование.
 ** ‘presaleService(_ :)’: принимает машину в качестве параметра. Метод отправляет машину на предпродажную подготовку.
 ** ‘addToShowroom(_ :)’: также принимает машину в качестве параметра. Метод перегоняет машину с парковки склада в автосалон, при этом выполняет предпродажную подготовку.
 ‘sellCar(_ :)’: также принимает машину в качестве параметра. Метод продает машину из автосалона при этом проверяет, выполнена ли предпродажная подготовка. Также, если у машины отсутсвует доп. оборудование, нужно предложить клиенту его купить. (давайте представим, что клиент всегда соглашается и покупает :) )
 ** ‘orderCar()’: не принимает и не возвращает параметры. Метод делает заказ новой машины с завода, т.е. добавляет машину на парковку склада.
 Обратите внимание! Каждый метод должен выводить в консоль информацию о машине и выполненном действии с ней.

Часть 3
Настало время добавить классы и структуры, реализующие созданные ранее протоколы.
Алгоритм выполнения:
 * Используя структуры, создайте несколько машин разных марок (например BMW, Honda, Audi, Lexus, Volvo). Все они должны реализовать протокол ‘Car’.
 * Используя классы, создайте пять различных дилерских центров (например BMW, Honda, Audi, Lexus, Volvo). Все они должны реализовать протокол ‘Dealership’. Каждому дилерскому центру добавьте машин на парковку и в автосалон (используйте те машины, которые создали ранее).
 * Создайте массив, положите в него созданные дилерские центры. Пройдитесь по нему циклом и выведите в консоль слоган для каждого дилеского центра (слоган можно загуглить).
 Обратите внимание! Используйте конструкцию приведения типа данных для решения этой задачи.

Часть 4
Работа с расширениями. Нам нужно добавить спецпредложение для “прошлогодних” машин.
Алгоритм выполнения:
 * Создайте протокол SpecialOffer.
 * Добавьте методы:
 ** ‘addEmergencyPack()’: не принимает никаких параметров. Метод добавляет аптечку и огнетушитель к доп. оборудованию машины.
 ** ‘makeSpecialOffer()’: не принимает никаких параметров. Метод проверяет дату выпуска авто, если год выпуска машины меньше текущего, нужно сделать скидку 15%, а также добавить аптеку и огнетушитель.
 * Используя расширение, реализуйте протокол ‘SpecialOffer’ для любых трех дилерских центров.
 * Проверьте все машины в дилерском центре (склад + автосалон), возможно они нуждаются в специальном предложении. Если есть машины со скидкой на складе, нужно перегнать их в автосалон.

Часть 5
Алгоритм выполнения:
 * Внесите изменения в метод ‘makeSpecialOffer()’ таким образом, чтобы он возвращал ошибку, если машина не соответствует требованиям акции.
 * В случае, если нет ошибки, сделайте для этой машины специальное предложение.
 * Проверьте текущий список машин, чтобы при проверке генерировались ошибки. При необходимости, внесите изменения.
 * Обработайте ошибки.

Часть №6

Алгоритм выполнения:
 * Перейдите к той части кода, где вы выполняли следующее задание: “Проверьте все машины в дилерском центре (склад + автосалон), возможно они нуждаются в специальном предложении. Если есть машины со скидкой на складе, нужно перегнать их в автосалон.”
 * Аналогично первой задаче, внесите изменения в код таким образом, чтобы осуществлялся возврат ошибки в том случае, если машина со скидкой уже находится в автосалоне. В том случае, если ошибки нет, нужно перегнать машину в автосалон.
 * Проверьте текущий список машин, чтобы при проверке генерировались ошибки. При необходимости, внесите изменения.
 * Обработайте ошибки.
 */
// часть №1
enum Model: Int {
    case X, Y, S, Z, M
}

enum Color: Int {
    case black, white, yello, grey, blue
}

enum CarCompany {
    case BMW, Honda, Audi, Lexus, Volvo
}

enum Accessories: String {
    case tinting = "тонировка"
    case alarm = "сингнализация"
    case sportsWheels = "спортивные диски"

    // добавил для части 4.2
    case firstAiKit = "аптечка"
    case fireExtinguisher = "огнетушитель"
}

protocol Car {
    var model: Model { get }
    var color: Color { get }
    var buildDate: UInt { get }
    var price: Double { get set }
    var accessories: [Accessories] { get set }
    var isServiced: Bool { get set }
    var isSpecialOffer: Bool { get set }
}

// часть №2
protocol Dealership {
    var name: CarCompany { get }
    var showroomCapacity: UInt { get }
    var stockCars: [Car] { get set }
    var showroomCars: [Car] { get set }
    var cars: [Car] { get set }

    func offerAccesories(accessories: [Accessories]) // Предложение дополнительного оборудования
    func presaleService(car: inout Car) // Препродажная подготовка
    func addToShowroom(car: inout Car) // Перегоняем авто со склада в автосалон, препродажная подготовка
    func sellCar(car: inout Car) // Продаем авто, препродажная подготовка, установка дополнительного оборудованя
    func orderCar() // Добаввляем машину с завода на склад
}

// часть №3
//print("часть №3")
// часть №3.1
struct BMW: Car {
    let model: Model
    let color: Color
    let buildDate: UInt
    var price: Double
    var accessories: [Accessories]
    var isServiced: Bool
    var isSpecialOffer = false
}

struct Honda: Car {
    let model: Model
    let color: Color
    let buildDate: UInt
    var price: Double
    var accessories: [Accessories]
    var isServiced: Bool
    var isSpecialOffer = false
}

struct Audi: Car {
    let model: Model
    let color: Color
    let buildDate: UInt
    var price: Double
    var accessories: [Accessories]
    var isServiced: Bool
    var isSpecialOffer = false
}

struct Lexus: Car {
    let model: Model
    let color: Color
    let buildDate: UInt
    var price: Double
    var accessories: [Accessories]
    var isServiced: Bool
    var isSpecialOffer = false
}

struct Volvo: Car {
    let model: Model
    let color: Color
    let buildDate: UInt
    var price: Double
    var accessories: [Accessories]
    var isServiced: Bool
    var isSpecialOffer = false
}

func getCar(carCompany: CarCompany) -> Car {
    switch carCompany {
    case .BMW:
        return BMW(model: Model(rawValue: Int.random(in: 0...4))!, color: Color(rawValue: Int.random(in: 0...4))!,
                         buildDate: UInt.random(in: 2020...2022), price: Double(Int.random(in: 10...30) * 1000), accessories:[], isServiced: false)
    case .Honda:
        return Honda(model: Model(rawValue: Int.random(in: 0...4))!, color: Color(rawValue: Int.random(in: 0...4))!,
                         buildDate: UInt.random(in: 2020...2022), price: Double(Int.random(in: 10...30) * 1000), accessories:[], isServiced: false)
    case .Audi:
        return Audi(model: Model(rawValue: Int.random(in: 0...4))!, color: Color(rawValue: Int.random(in: 0...4))!,
                         buildDate: UInt.random(in: 2020...2022), price: Double(Int.random(in: 10...30) * 1000), accessories:[], isServiced: false)
    case .Lexus:
        return Lexus(model: Model(rawValue: Int.random(in: 0...4))!, color: Color(rawValue: Int.random(in: 0...4))!,
                         buildDate: UInt.random(in: 2020...2022), price: Double(Int.random(in: 10...30) * 1000), accessories:[], isServiced: false)
    case .Volvo:
        return Volvo(model: Model(rawValue: Int.random(in: 0...4))!, color: Color(rawValue: Int.random(in: 0...4))!,
                         buildDate: UInt.random(in: 2020...2022), price: Double(Int.random(in: 10...30) * 1000), accessories:[], isServiced: false)
    }
}

// часть №3.2
class DealershipCar: Dealership {
    let name: CarCompany
    let showroomCapacity: UInt
    var stockCars: [Car]
    var showroomCars: [Car]
    var cars: [Car] {
        get {
            return stockCars + showroomCars
        }
        set {
        }
    }

    init(name: CarCompany, showroomCapacity: UInt, stockCars: [Car], showroomCars: [Car]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = stockCars + showroomCars
    }

    // Предложение дополнительного оборудования
    func offerAccesories(accessories: [Accessories]) {
        let accessoriesString = accessoriesInString(accessories: accessories)
        print("Клиенту установили дополнительное оборудование: \(accessoriesString.dropLast(2))")
    }

    // Препродажная подготовка
    func presaleService(car: inout Car) {
        if car.isServiced {
            print("Предпродажная подготовка была уже произведена для автомобиля:")
        } else {
            car.isServiced = true
            print("Проводим предпродажную подготовку для автомобиля:")
        }
        getInfoCar(car: car)
    }

    // Перегоняем авто со склада в автосалон, препродажная подготовка
    func addToShowroom(car: inout Car) {
        for (index, value) in stockCars.enumerated() {
            if value.model == car.model && value.color == car.color && value.buildDate == car.buildDate &&
                value.accessories == car.accessories && value.isServiced == car.isServiced {
                stockCars.remove(at: index)
                break
            }
        }

        presaleService(car: &car)
        showroomCars.append(car)
        print("Перегнали автомобиль с парковки склада в автосалон: ")
        getInfoCar(car: car)
    }

    // Продаем авто, препродажная подготовка, установка дополнительного оборудованя
    func sellCar(car: inout Car) {
        print("Продали автомобиль:")
        getInfoCar(car: car)
        presaleService(car: &car)

        if car.accessories.isEmpty {
            offerAccesories(accessories: [.alarm, .sportsWheels, .tinting])
            car.accessories.append(.alarm)
            car.accessories.append(.tinting)
            car.accessories.append(.sportsWheels)
        }
    }

    // Добаввляем машину с завода на склад
    func orderCar() {
        let car = getCar(carCompany: .BMW)
        stockCars.append(car)
        print("Производим заказ с завода новой машины:")
        getInfoCar(car: car)
        }

    // Выводим информацию о машине
    func getInfoCar(car: Car) -> Void {
        let accessoriesString = accessoriesInString(accessories: car.accessories)
        print(" автомобиль фирмы \"\(name)\", модель \"\(car.model)\", цвет \"\(car.color)\", дата выпуска \(car.buildDate) года, цена авто: $ \(car.price), дополнительное оборудование: \(accessoriesString.dropLast(2))")

    }

    // Преобразуем массив дополнительного оборудования в строку
    func accessoriesInString(accessories: [Accessories]) -> String {
        var accessoriesString = ""
        if accessories.isEmpty {
            accessoriesString = "не установлено, "
        } else {
            accessories.forEach { accessory in
                accessoriesString += accessory.rawValue + ", "
            }
        }
        return accessoriesString
    }
}

class DealershipBMW: DealershipCar {}
class DealershipHonda: DealershipCar {}
class DealershipAudi: DealershipCar {}
class DealershipLexus: DealershipCar {}
class DealershipVolvo: DealershipCar {}

var dealershipBMW = DealershipBMW(name: .BMW, showroomCapacity: 100, stockCars: [getCar(carCompany: .BMW), getCar(carCompany: .BMW)], showroomCars: [getCar(carCompany: .BMW), getCar(carCompany: .BMW)])
var dealershipHonda = DealershipHonda(name: .Honda, showroomCapacity: 90, stockCars: [getCar(carCompany: .Honda), getCar(carCompany: .Honda)], showroomCars: [getCar(carCompany: .Honda), getCar(carCompany: .Honda)])
var dealershipAudi = DealershipAudi(name: .Audi, showroomCapacity: 80, stockCars: [getCar(carCompany: .Audi), getCar(carCompany: .Audi)], showroomCars: [getCar(carCompany: .Audi), getCar(carCompany: .Audi)])
var dealershipLexus = DealershipLexus(name: .Lexus, showroomCapacity: 70, stockCars: [getCar(carCompany: .Lexus), getCar(carCompany: .Lexus)], showroomCars: [getCar(carCompany: .Lexus), getCar(carCompany: .Lexus)])
var dealershipVolvo = DealershipVolvo(name: .Volvo, showroomCapacity: 60, stockCars: [getCar(carCompany: .Volvo), getCar(carCompany: .Volvo)], showroomCars: [getCar(carCompany: .Volvo), getCar(carCompany: .Volvo)])

var carBMW = dealershipBMW.stockCars.first!
print("Задача - перегонять автомобиль с парковки склада в автосалон:")
dealershipBMW.addToShowroom(car: &carBMW)

carBMW = dealershipBMW.stockCars.last!
print("\nЗадача - продавть авто:")
dealershipBMW.sellCar(car: &carBMW)

print("\nЗадача - заказать с завода авто")
dealershipBMW.orderCar()

// часть №3.3
let dealerships = [dealershipBMW, dealershipHonda, dealershipAudi, dealershipLexus, dealershipVolvo]
print("\nСлоган:")
dealerships.forEach{ dealership in
    switch dealership {
    case is DealershipBMW:
        print("BMW: \"С удовольствием за рулем\"")
    case is DealershipHonda:
        print("Honda: \"Сила мечты\"")
    case is DealershipAudi:
        print("Audi: \"Превосходство высоких технологий\"")
    case is DealershipLexus:
        print("Lexus: \"Простота, основанная на технология\"")
    case is DealershipVolvo:
        print("Volvo: \"Вольво для жизни!\"")
    default:
        print("Toyoto: Управляй мечтой")
    }
}

// часть №4, 5, 6
print("\nчасть №4")
enum DealershipError: Error {
    case noSpecialOffer
    case noMoveCar

}
protocol SpecialOffer {
    func addEmergencyPack()
    func makeSpecialOffer() throws
}

extension DealershipCar: SpecialOffer {
    func addEmergencyPack() {
        offerAccesories(accessories: [.firstAiKit, .fireExtinguisher])
    }

    func makeSpecialOffer() throws {
        var result = [Car]()

        print("Уцененные автомобили в автосалоне:")
        for (index, value) in showroomCars.enumerated() {
            if value.buildDate < 2022 {
                print("\nСкидка на автомобиль в размере 15% составляет: $ \(value.price * 0.15): ")
                getInfoCar(car: value)
                showroomCars[index].price *= 0.85
                showroomCars[index].isSpecialOffer = true
                addEmergencyPack()
                showroomCars[index].accessories.append(.firstAiKit)
                showroomCars[index].accessories.append(.fireExtinguisher)
            } else {
                getInfoCar(car: value)
                throw DealershipError.noSpecialOffer
            }
        }

        print("\nУцененные автомобили на складе парковки:")
        for (index, value) in stockCars.enumerated() {
            if stockCars[index].buildDate < 2022 {
                print("\nСкидка на автомобиль в размере 15% составляет: $ \(value.price * 0.15): ")
                getInfoCar(car: stockCars[index])
                stockCars[index].price *= 0.85
                stockCars[index].isSpecialOffer = true
                addEmergencyPack()
                stockCars[index].accessories.append(.firstAiKit)
                stockCars[index].accessories.append(.fireExtinguisher)
                result.append(stockCars[index])
            } else {
                getInfoCar(car: value)
                throw DealershipError.noSpecialOffer
            }
        }

        print("\nПерегоняем цененные автомобили со склада парковки в автосалон:")
        for value in showroomCars {
            if value.isSpecialOffer == true {
                getInfoCar(car: value)
                throw DealershipError.noMoveCar
            } else {
                for (index, _) in result.enumerated() {
                    print()
                    addToShowroom(car: &result[index])
                }
            }
        }
    }
}

var dealershipsOldCar = [dealershipBMW, dealershipHonda, dealershipAudi]

dealershipsOldCar.forEach { dealership in
    print("\nДилерский центр - \(dealership.name)")
    do {
        try dealership.makeSpecialOffer()
    } catch DealershipError.noSpecialOffer {
        print("Ошибка: данный автомобиль не подходит под акцию")
    } catch DealershipError.noMoveCar {
        print("Ошибка: данный автомобиль находится в автосалоне")
    } catch {
        print("Ошибка: не известная ошибка. Обратитесь к разработчику")
    }
}

// Курсовой проект “Основы Swift advanced”
print("\nКурсовой проект “Основы Swift advanced”")
/*
Алгоритм решения:
 1. Создайте следующие протоколы и определите в них свойства и методы.
 1.1. Ресторан
 Свойства: название, сотрудники, склад с продуктами, меню.
 1.2. Сотрудник
 Свойства: имя, пол, возраст, должность (менеджер, повар, официант и т.д.).
 1.3. Блюдо
 Свойства: тип блюда (салат, горячее, гарнир, десерт), ингредиенты (картофель, лук, мясо, соль), время приготовления, цена.
 1.4. Заказ
 Свойства: время получения заказа, время отдачи заказа, блюда в заказе, готовность.

 2. Создайте следующие классы и структуры.
 2.1. Должности (менеджер, повар, официант и т.д.) подписать под протокол Сотрудник. Свойства и методы зависят от должности. Для поваров продумать несколько должностей. Каждый должен иметь метод “готовить”, но иметь еще свои методы. Например, повар холодного цеха делает салаты; повар горячего цеха умеет варить и жарить, шеф-повар умеет все (можно сделать привязку к типу блюда).
 2.2. Конкретные блюда подписать под протокол Блюда. Ингредиенты зависят от типа блюда. Например, для яичницы нужны: яйца, масло, соль. Создать минимум 5 блюд.
 2.3. Заказ подпишите под протокол Заказы.

 3. Создайте хранилища:
 3.1 продукты (ингредиенты), хранящиеся на складе с указанием количества (продумайте, какой вид коллекции использовать). Создайте минимум 15 продуктов на складе.
 3.2 заказы. Содержит в себе заказы.
 Добавлять свои свойства и методы допустимо.
 Продумайте, где можно и нужно использовать enum вместо стандартных свойств.

 Задача co звездочкой (необязательное задание)
 Реализуйте логику в методах. Например, у официанта метод “принять заказ” добавляет в начало хранилища с заказами переданный заказ. Повар берет первый добавленный заказ из хранилища и готовит. В данном случае нужно разобраться с FIFO и LIFO. После приготовления устанавливается время приготовления, статус меняется на “готов”. Наприер, вы можете учесть, что от типа блюда заказ может выполнить нужный повар или шеф. Реализуйте любую логику на ваше усмотрение.
 */
// задача №1

// enum
enum Gender {
    case male
    case female
}

enum Position {
    case manager
    case cooker
    case waiter
    case cleaner
}

enum TypeOfDish: String {
    case salad = "салат"
    case mainDish = "горячее блюдо"
    case sideDish = "холодное блюдо"
    case dessert = "десерт"
}

enum Ingredients: String {
    case potatoes = "картофель"
    case onions = "лук"
    case meat = "мясо"
    case salt = "соль"
}

// protocol
protocol Restaurant {
    var name: String { get }
    var employees: [Employee] { get set }
    var warehouseWithProducts: [String: Int] { get set }
    var menu: [Dish] { get set }
}

protocol Employee {
    var name: String { get }
    var gender: Gender { get }
    var age: Int { get set }
    var position: Position { get set }
}

protocol Dish {
    var name: String { get }
    var typeOfDish: TypeOfDish { get }
    var ingredients: [Ingredients] { get }
    var cookingTime: Int { get }
    var price: Int { get }
}

protocol Orders {
    var timeReceiptOrder: Int { get }
    var timeDeliveryOrder: Int { get }
    var dishesInOrders: [Dish] { get }
    var isReady: Bool {get set }
}

// задача №2

// сотрудники
struct Manager: Employee {
    let name: String
    let gender: Gender
    var age: Int
    var position: Position
    var hasGoodMood = false // А надо ли?

    func commandTeams() {
        if hasGoodMood {
            print("\t\"Всем выписать премию за отличную работу!\"")
        } else {
            print("\t\"Ускорьтесь, кулинарные крысы, у нас много дел!\"")
        }
    }
}

struct CheffCooker: Employee {
    let name: String
    let gender: Gender
    var age: Int
    var position: Position
    var isBuse = false

    func cook(dish: Dish) {
        for ingredient in dish.ingredients {
            if let ingredientAmount = storage[ingredient.rawValue], ingredientAmount > 0 {
                storage[ingredient.rawValue]! -= 1
            } else {
                print("Данного ингридиента нет в наличии, надо срочно бежать в магазин!")
            }
        }

        switch dish.typeOfDish {
        case .dessert:
            cookDessert(dish: dish)
        case .salad:
            cookSalad(dish: dish)
        case .mainDish:
            cookMainDish(dish: dish)
        case .sideDish:
            cookSideDish(dish: dish)
        }
    }

    private func cookSalad(dish: Dish) {
        print("Повар \"\(name)\" приготовил салат: \(dish.name)")
    }

    private func cookMainDish(dish: Dish) {
        print("Повар \"\(name)\" приготовил горячее блюдо: \(dish.name)")
    }

    private func cookSideDish(dish: Dish) {
        print("Повар \"\(name)\" приготовил холодное блюдо: \(dish.name)")
    }

    private func cookDessert(dish: Dish) {
        print("Повар \"\(name)\" приготовил десерт: \(dish.name)")
    }
}

struct ColdShopCooker: Employee {
    let name: String
    let gender: Gender
    var age: Int
    var position: Position
    var isBuse = false

    func cook(dish: Dish) {
        for ingredient in dish.ingredients {
            if let ingredientAmount = storage[ingredient.rawValue], ingredientAmount > 0 {
                storage[ingredient.rawValue]! -= 1
            } else {
                print("Данного ингридиента нет в наличии, надо срочно бежать в магазин!")
            }
        }

        switch dish.typeOfDish {
        case .dessert:
            cookDessert(dish: dish)
        case .salad:
            cookSalad(dish: dish)
        default:
            print("Я не умею готовить блюдо: \(dish.typeOfDish.rawValue)")
        }
    }

    private func cookSalad(dish: Dish) {
        print("Повар \"\(name)\" приготовил салат: \(dish.name)")
    }
    private func cookDessert(dish: Dish) {
        print("Повар \"\(name)\" приготовил десерт: \(dish.name)")
    }
}

struct HotShopCooker: Employee {
    let name: String
    let gender: Gender
    var age: Int
    var position: Position
    var isBuse = false

    func cook(dish: Dish) {
        for ingredient in dish.ingredients {
            if let ingredientAmount = storage[ingredient.rawValue], ingredientAmount > 0 {
                storage[ingredient.rawValue]! -= 1
            } else {
                print("Данного ингридиента нет в наличии, надо срочно бежать в магазин!")
            }
        }

        switch dish.typeOfDish {
        case .mainDish:
            cookMainDish(dish: dish)
        case .sideDish:
            cookSideDish(dish: dish)
        default:
            print("Я не умею готовить блюдо: \(dish.typeOfDish.rawValue)")
        }
    }

    private func cookMainDish(dish: Dish) {
        print("Повар \"\(name)\" приготовил горячее блюдо: \(dish.name)")
    }
    private func cookSideDish(dish: Dish) {
        print("Повар \"\(name)\" приготовил холодное блюдо: \(dish.name)")
    }
}

struct Waiter: Employee {
    let name: String
    let gender: Gender
    var age: Int
    var position: Position
    var isBuse = false

    func receiveOrder(number: Int, arrayOrder: [Dish]) {
        let factor: Int
        if isBuse == true {
            factor = 2
        } else {
            factor = 1
        }
        ordersAccepts.append(Order(timeReceiptOrder: Int(number * 5 * factor), dishesInOrders: arrayOrder))
    }

    func carryOrder(number: Int)  {
        ordersAccepts[number].isReady = true
    }

}

struct Cleaner: Employee {
    let name: String
    let gender: Gender
    var age: Int
    var position: Position
    var inCleanClothes = true

    mutating func clean() {
        self.inCleanClothes = false
    }

    mutating func changeClothes() {
        self.inCleanClothes = true
    }
}

// блюда
// side dish
struct Puree: Dish {
    let name: String
    let typeOfDish: TypeOfDish
    let ingredients: [Ingredients] = [.potatoes]
    let cookingTime: Int
    let price: Int
}

// main dish
struct Chop: Dish {
    let name: String
    let typeOfDish: TypeOfDish
    let ingredients: [Ingredients]  = [.potatoes, .meat, .onions, .salt]
    let cookingTime: Int
    let price: Int
}

// salat
struct PotatoSalad: Dish {
    let name: String
    let typeOfDish: TypeOfDish
    let ingredients: [Ingredients]  = [.potatoes, .onions, .salt]
    let cookingTime: Int
    let price: Int
}

// // main dish
struct Soup: Dish {
    let name: String
    let typeOfDish: TypeOfDish
    let ingredients: [Ingredients]  = [.meat]
    let cookingTime: Int
    let price: Int
}

// desert
struct PotatoCake: Dish {
    let name: String
    let typeOfDish: TypeOfDish
    let ingredients: [Ingredients]  = [.potatoes, .onions]
    let cookingTime: Int
    let price: Int
}

// заказ
struct Order: Orders {
    let timeReceiptOrder: Int
    var timeDeliveryOrder: Int {
        var time: Int = timeReceiptOrder
        for dishesInOrder in dishesInOrders {
            time += dishesInOrder.cookingTime
        }
        return time
    }

    let dishesInOrders: [Dish]
    var isReady: Bool = false
}

// задача №3

//хранилище
var storage: [String: Int] = [
    "картофель": 100,
    "лук": 100,
    "мясо": 10,
    "соль": 1000,
    "перец": 1000,
    "молоко": 10,
    "чай": 200,
    "кофе": 200,
    "яйцо": 300,
    "сыр": 10,
    "сок": 20,
    "газировка": 30,
    "кетчуп": 50,
    "майонез": 50,
    "хлеб": 10,
    "пиво": 30]

// заказы
let puree = Puree(name: "Картофельное пюре", typeOfDish: .sideDish, cookingTime: 25, price: 10)
let chop = Chop(name: "Отбивная", typeOfDish: .mainDish, cookingTime: 30, price: 20)
let potatoSalad = PotatoSalad(name: "Картофельный салат", typeOfDish:.salad, cookingTime: 15, price: 25)
let soup = Soup(name: "Картофельный суп", typeOfDish: .mainDish, cookingTime: 30, price: 30)
let potatoCake = PotatoCake(name: "Картофельный торт", typeOfDish: .dessert, cookingTime: 60, price: 50)
let arrayOrders: [Dish] = [puree, chop, potatoSalad, soup, potatoCake]

// задача №4*
class KFS: Restaurant {
    let name: String
    var employees: [Employee]
    var warehouseWithProducts: [String: Int]
    var menu: [Dish]

    init(name: String, employees: [Employee], warehouseWithProducts: [String: Int], menu: [Dish]) {
        self.name = name
        self.employees = employees
        self.warehouseWithProducts = warehouseWithProducts
        self.menu = menu
    }
}

var manager = Manager(name: "Полковник Сандерс", gender: .male, age: 90, position: .manager)
var cheffCooker = CheffCooker(name: "Грю Фелониус Мексон", gender: .male, age: 58, position: .cooker)
var coldShopCooker = ColdShopCooker(name: "Кевин", gender: .male, age: 25, position: .cooker)
var hotShopCooker = HotShopCooker(name: "Боб", gender: .male, age: 25, position: .cooker)
var waiter = Waiter(name: "Стюарт", gender: .male, age: 25, position: .waiter)
var cleaner = Cleaner(name: "Скарлет", gender: .female, age: 50, position: .cleaner)
var kfs = KFS(name: "Kentucky Fried Chicken", employees: [manager, cheffCooker, coldShopCooker, hotShopCooker, waiter, cleaner], warehouseWithProducts: storage, menu: [puree, chop, potatoSalad, soup, potatoCake])

// реализация
var ordersAccepts = [Order]()
var arrayOrder = [Dish]()

print("Акт №1")
print("Где-то в Белоруссии ресторан \"\(kfs.name)\" открыл двери в 10:00")
print("Зашел главный менеджер \"\(manager.name)\" и прокричал:")
manager.commandTeams()

print("Спустя 15 минут стали приходить посетители")
for number in 0...5  {
    print("\nПриходит посетитель № \(number + 1): называет официанту \"\(waiter.name)у\" заказ:")
    var tempString = ""
    arrayOrder = []
    for _ in 1...Int.random(in: 1...3) { // Здесь указывается max кол-во блюд в заказе
        let tempOrder = arrayOrders[Int.random(in: 0...kfs.menu.count - 1)]
        tempString += tempOrder.name + ", "
        print("\t\(tempOrder.name)")
        arrayOrder.append(tempOrder)
    }
    waiter.receiveOrder(number: number, arrayOrder: arrayOrder)

    for (index, values) in ordersAccepts.enumerated() {
        // проверяем готов ли заказ, где (number + 1) * X <- это ускоритель времени (-_(-_-)_-)
        if values.isReady == false && values.timeDeliveryOrder < (number + 1) * 50 {
            print()
            for dish in values.dishesInOrders {
                switch dish.typeOfDish {
                case .dessert, .salad:
                    if Int.random(in: 0...1) == 0 {
                        coldShopCooker.cook(dish: dish)
                    } else {
                        cheffCooker.cook(dish: dish)
                    }
                case .mainDish, .sideDish:
                    if Int.random(in: 0...1) == 0 {
                        hotShopCooker.cook(dish: dish)
                    } else {
                        cheffCooker.cook(dish: dish)
                    }
                }
            }
            waiter.carryOrder(number: index)
            print("\nОфициант \"\(waiter.name)\" относит посетителю № \(index + 1) заказ:")
            for dish in ordersAccepts[index].dishesInOrders {
                print("\t\(dish.name)")
            }
        }
    }

    // после 5 посетителя официант устал и стал медленнее работать
    if number > 5 {
        waiter.isBuse = true
    }

}

print("\nАкт №2")
print("Ресторан \"\(kfs.name)\" закрыл двери в 22:00")
print("Главный менеджер \"\(manager.name)\" подсчитал выручку и прокричал:")
manager.hasGoodMood = true
manager.commandTeams()
print("Все пошли домой, кроме \"\(cleaner.name)\", ей придется всю ночь отмывать ресторан для следующих посетителей")
cleaner.clean()
cleaner.changeClothes()
if cleaner.inCleanClothes {
    print("Убрав все до конца, \"\(cleaner.name)\" тоже поехала домой")
}
print("T H E    E N D")
