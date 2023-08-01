import Foundation

/**
    A three-element vector.
*/
public struct SGVector: CustomStringConvertible {
    public var x: Double
    public var y: Double
    public var z: Double

    /**
        Creates a vector with double-precision zero values.
    */
    public init() { 
        self.x = 0.0
        self.y = 0.0
        self.z = 0.0
    }

    /**
        Creates a vector from the specified double-precision values.
    */
    public init(x: Double, y: Double, z: Double) {
        self.x = x
        self.y = y
        self.z = z
    }

    /**
        Creates a vector from the specified floating-point values.
    */
    public init<T>(x: T, y: T, z: T) where T : BinaryFloatingPoint {
        self.x = Double(x)
        self.y = Double(y)
        self.z = Double(z)
    }

    /**
        Creates a vector from the specified SpatialGraphics point structure.
    */
    public init(_ point: SGPoint) {
        self.x = point.x
        self.y = point.y
        self.z = point.z
    }

    public static var zero: SGVector {
        return SGVector()
    }

    public var description: String {
        // (x: Double, y: Double, z: Double)
        // let title: String = "SGVector(x: Double, y: Double, z: Double)"
        let value: String = "SGVector<x: \(self.x), y: \(self.y), z: \(self.z)>"
        // return "SGVector< x: \(self.x), y: \(self.y), z: \(self.z) >\n"
        return value
    }
}

extension SGVector: AdditiveArithmetic {

    public static func + (lhs: SGVector, rhs: SGVector) -> SGVector {
        return SGVector(x: lhs.x + rhs.x, y: lhs.y + rhs.y, z: lhs.z + rhs.z)
    }

    public static func - (lhs: SGVector, rhs: SGVector) -> SGVector {
        return SGVector(x: lhs.x - rhs.x, y: lhs.y - rhs.y, z: lhs.z - rhs.z)
        
    }

}

extension SGVector: SGScalable {
    public mutating func scale(by size: SGSize) {
        self.x *= size.width
        self.y *= size.height
        self.z *= size.depth
    }

    public mutating func scaleBy(x: Double, y: Double, z: Double) {
        self.x *= x
        self.y *= y
        self.z *= z
    }

    public func scaled(by: SGSize) -> SGVector {
        return SGVector(x: self.x * by.width, y: self.y * by.width, z: self.z * by.depth)
    }

    public func scaledBy(x: Double, y: Double, z: Double) -> SGVector {
        return SGVector(x: self.x * x, y: self.y * y, z: self.z * z)
    }

    public mutating func uniformlyScale(by magnitude: Double) {
        self.x *= magnitude
        self.y *= magnitude
        self.z *= magnitude
    }

    public func uniformlyScaled(by magnitude: Double) -> SGVector {
        return SGVector(x: self.x * magnitude, y: self.y * magnitude, z: self.z * magnitude)
    }
    
}