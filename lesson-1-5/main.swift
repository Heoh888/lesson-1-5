
enum GetInTheCar: String {
    case sit = "Вы сели в машину"
    case goOut = "Вы вышли из машины"
}

enum ActivateWindows {
    case open
    case close
}

enum EngineStatus {
    case started
    case muted
}

// Основной протокол для все классов
protocol Car {
    var year: Int { get };
    var color: String { get };
    var weight: Double { get };
    var getCar: GetInTheCar { get };

   func getInTheCar(getCar: GetInTheCar)
}

// расширение для протокола Car
extension Car {
    var windows: ActivateWindows { return self as! ActivateWindows }
    var engine: EngineStatus { return self as! EngineStatus }
    
    func activateWindows(windows: ActivateWindows) -> String {
        var status: String = ""
        if windows == .open {
            status = "Окна открыты"
        }
        if windows == .close {
            status = "Окна закрыты"
        }
        return status
    }
    
    func engineStatus(engine: EngineStatus) -> String {
        var status: String = ""
        if engine == .started {
            status = "Двигатель заведен"
        }
        if engine == .muted {
            status = "Двигатель заглушен"
        }
        return status
    }
}

// класс TrunkCar
class TrunkCar: Car {
    var year: Int
    var color: String
    var weight: Double
    var getCar: GetInTheCar
    var bodyVolume: Int

    func getInTheCar(getCar: GetInTheCar) {
        self.getCar = getCar
    }
    
    init(year: Int, color: String, weight: Double, getCar: GetInTheCar, bodyVolume: Int) {
        self.year = year
        self.color = color
        self.weight = weight
        self.getCar = getCar
        self.bodyVolume = bodyVolume
    }
}

// расширение для класса TrunkCar: CustomStringConvertible
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Год: \(year), Цвет:\(color), Вес:\(weight) кг., Объем кузова\(bodyVolume) м³, \(getCar.rawValue),"
    }
}

// класс SportСar
class SportСar: Car {
    var year: Int
    var color: String
    var weight: Double
    var getCar: GetInTheCar
    var enginePower: Double
    
    func getInTheCar(getCar: GetInTheCar) {
        self.getCar = getCar
    }
    
    // Функция определения разгона от 0 до 100 км
    func overclockingTime() -> String {
        let time = (weight/enginePower*100).rounded()/100
        return "Разгон от 0 до 100 км за \(time) секунды."
    }
    
    init(year: Int, color: String, weight: Double, getCar: GetInTheCar, enginePower: Double) {
        self.year = year
        self.color = color
        self.weight = weight
        self.getCar = getCar
        self.enginePower = enginePower
    }
}

// расширение для класса SportСar: CustomStringConvertible
extension SportСar: CustomStringConvertible {
    var description: String {
        return "Год: \(year), Цвет:\(color), Вес:\(weight) кг., Мощность двигателя \(enginePower) л.с., \(getCar.rawValue), \(overclockingTime())"
    }
}
// Иницилизируем экземпляры
var volvo = TrunkCar( year: 2017, color: "Белый", weight: 7550, getCar: .goOut, bodyVolume: 75)
volvo.getInTheCar(getCar: .sit)

var kamaz = TrunkCar( year: 2019, color: "Черный", weight: 6180, getCar: .goOut, bodyVolume: 40)
//kamaz.getInTheCar(getCar: .sit)

var lotus = SportСar( year: 2017, color: "Желтый", weight: 1750, getCar: .goOut, enginePower: 445)
lotus.getInTheCar(getCar: .sit)

var ferrari = SportСar( year: 2020, color: "Красный", weight: 1600, getCar: .goOut, enginePower: 525)
//lotus.getInTheCar(getCar: .sit)


// Выведем в консоль
print(volvo, volvo.activateWindows(windows: .open), volvo.engineStatus(engine: .started))
print(kamaz, kamaz.activateWindows(windows: .close), kamaz.engineStatus(engine: .muted))

print(lotus, lotus.activateWindows(windows: .open), lotus.engineStatus(engine: .started))
print(ferrari, ferrari.activateWindows(windows: .close), ferrari.engineStatus(engine: .muted))


