// "0.1.0"
// "2023.7.28.1"

import Foundation

public struct SGPoint: CustomStringConvertible, AdditiveArithmetic, Comparable {
    var x: Double
    var y: Double
    var z: Double

    /**
        Creates a point with double-precision zero values.
    */
    public init() { 
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
    }

    /**
        Creates a point from the specified double-precision values.
    */
    public init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }

    /**
        Creates a point from the specified floating-point values.
    */
    public init<T>(x: T, y: T, z: T) where T : BinaryFloatingPoint {
        self.x = Double(x)
        self.y = Double(y)
        self.z = Double(z)
    }

    /**
        Creates a point from the specified SpatialGraphics vector structure.
    */
    public init(_ vector: SGVector) {
        self.x = vector.x
        self.y = vector.y
        self.z = vector.z
    }

    public init(point: SGPoint) {
        self.x = point.x
        self.y = point.y
        self.z = point.z
    }

    public static var zero: SGPoint {
        return SGPoint()
    }

    public var description: String {
        return "SGPoint(x: \(self.x), y: \(self.y), z: \(self.z))"
    }

    /**
        Creates a new instance with the specified raw value.
    */
    public static func - (lhs: SGPoint, rhs: SGPoint) -> SGPoint {
        return SGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y, z: lhs.z - rhs.z)
    }

    /**
        Creates a point from the specified arithmetic operation of two points.
    */
    public static func + (lhs: SGPoint, rhs: SGPoint) -> SGPoint {
        return SGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y, z: lhs.z + rhs.z)
    }

    /**
        The distance between two points.
    */
    public static func distanceBetween(lhs: SGPoint, rhs: SGPoint) -> Double {
        return ((rhs.x - lhs.x)*(rhs.x - lhs.x) + (rhs.y - lhs.y)*(rhs.y - lhs.y) + (rhs.z - lhs.z)*(rhs.z - lhs.z)).squareRoot()
    }
    
    public static func < (lhs: SGPoint, rhs: SGPoint) -> Bool {
        return distanceBetween(lhs: lhs, rhs: rhs) < 0
    }

    public static func == (lhs: SGPoint, rhs: SGPoint) -> Bool {
        return distanceBetween(lhs: lhs, rhs: rhs) == 0
    }
}