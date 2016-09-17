//: Playground - noun: a place where people can play

protocol Bird {
    var name: String { get }
    var canFly: Bool { get }
}

// 비행할 수 있는.
protocol Flyable {
    var airspeedVelocity: Double { get }
}

struct FlappyBird: Bird, Flyable {
    let name: String
    let flappyAmplitude: Double
    let flappyFrequency: Double
    let canFly: Bool
    
    var airspeedVelocity: Double {
        return 3 * flappyFrequency * flappyAmplitude
    }
}