import Foundation

/**
    A three-element size.
*/
public struct SGSize: CustomStringConvertible {
    public var width: Double
    public var height: Double
    public var depth: Double

    /**
        Creates a size with double-precision zero values.
    */
    public init() { 
        self.width = 0.0
        self.height = 0.0
        self.depth = 0.0
    }

    /**
        Creates a size from the specified double-precision values.
    */
    public init(width: Double, height: Double, depth: Double) {
        self.width = width
        self.height = height
        self.depth = depth
    }

    /**
        Creates a size from the specified floating-point values.
    */
    public init<T>(width: T, height: T, depth: T) where T : BinaryFloatingPoint {
        self.width = Double(width)
        self.height = Double(height)
        self.depth = Double(depth)
    }


    public static var zero: SGSize {
        return SGSize()
    }

    public var description: String {
        // let value: String = "SGSize<width: \(self.width), height: \(self.height), depth: \(self.depth)>"
        return "SGSize<width: \(self.width), height: \(self.height), depth: \(self.depth)>"
    }
}

extension SGSize: Comparable {

    public var magnitude: Double {
        let w: Double = self.width * self.width
        let h: Double = self.height * self.height
        let d: Double = self.depth * self.depth
        return (w + h + d).squareRoot()
        // return (self.wi + y*y + z*z).squareRoot()
    }

    public static func < (lhs: SGSize, rhs: SGSize) -> Bool {
        return lhs.magnitude < rhs.magnitude
    }

    public static func == (lhs: SGSize, rhs: SGSize) -> Bool {
        return lhs.magnitude == rhs.magnitude
    }
}

extension SGSize {
    /**
        Creates a point from the specified arithmetic operation of two points.
    */
    public static func *= (lhs: inout SGSize, rhs: SGSize) {
        lhs.width = lhs.width * rhs.width
        lhs.height = lhs.height * rhs.height
        lhs.depth = lhs.depth * rhs.depth
    }
}