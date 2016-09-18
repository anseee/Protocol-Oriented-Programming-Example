//: Playground - noun: a place where people can play

protocol Bird {
    var name: String { get }
    var canFly: Bool { get }
}

protocol Flyable {
    var airspeedVelocity: Double { get }
}

struct FlappyBird: Bird, Flyable {
    let name: String
    let flappyAmplitude: Double
    let flappyFrequency: Double
    
    var airspeedVelocity: Double {
        return 3 * flappyFrequency * flappyAmplitude
    }
}

//Make Penguin
struct Penguin: Bird {
    let name:String
    let canFly = false
}

//Make Swift Bird
struct SwiftBird: Bird, Flyable {
    var name: String { return "Swift \(version)" }
    let version: Double
    
    //Swift is fast
    var airspeedVelocity: Double { return 2000.0 }
}

extension Bird where Self:Flyable {
    var canFly: Bool { return true }
}

enum UnladenSwallow: Bird, Flyable {
    case African
    case European
    case Unknown
    
    var name: String {
        switch self {
        case .African:
            return "African"
        case .European:
            return "European"
        case .Unknown:
            return "What do you mean? African or European?"
        }
    }
    
    var airspeedVelocity: Double {
        switch self {
        case .African:
            return 10.0
        case .European:
            return 9.9
        case .Unknown:
            fatalError ("What do you mean? African or European?")
        }
    }
}

extension Collection {
    func skip(skip: Int) -> [Generator.Element] {
        guard skip != 0 else {
            return []
        }
        
        var index = self.startIndex
        var result: [Generator.Element] = []
        var i = 0
        
        repeat {
            if i % skip == 0 {
                result.append(self[index])
            }
            
            index = self.index(after: index)
            i += 1
            
        } while index != self.endIndex
        
        return result
    }
}

let bunchaBirds: [Bird] =
    [UnladenSwallow.African,
     UnladenSwallow.European,
     UnladenSwallow.Unknown,
     Penguin(name: "King Penguin"),
     SwiftBird(version: 3.0),
     FlappyBird(name: "Felipe", flappyAmplitude: 3.0, flappyFrequency: 20.0)]

bunchaBirds.skip(skip: 3)