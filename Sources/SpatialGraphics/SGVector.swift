import Foundation

/**
    A three-element vector.
*/
struct SGVector: CustomStringConvertible {
    var x: Double
    var y: Double
    var z: Double

    /**
        Creates a vector with double-precision zero values.
    */
    init() { 
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
    }

    /**
        Creates a vector from the specified double-precision values.
    */
    init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }

    /**
        Creates a vector from the specified floating-point values.
    */
    init<T>(x: T, y: T, z: T) where T : BinaryFloatingPoint {
        self.x = Double(x)
        self.y = Double(y)
        self.z = Double(z)
    }

    /**
        Creates a vector from the specified SpatialGraphics point structure.
    */
    init(_ point: SGPoint) {
        self.x = point.x
        self.y = point.y
        self.z = point.z
    }

    static var zero: SGVector {
        return SGVector()
    }

    var description: String {
        // (x: Double, y: Double, z: Double)
        // let title: String = "SGVector(x: Double, y: Double, z: Double)"
        let value: String = "SGVector<x: \(self.x), y: \(self.y), z: \(self.z)>"
        // return "SGVector< x: \(self.x), y: \(self.y), z: \(self.z) >\n"
        return value
    }
}