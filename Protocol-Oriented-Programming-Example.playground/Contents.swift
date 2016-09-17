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
