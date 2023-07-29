import Foundation

/**
    A three-element size.
*/
struct SGSize: CustomStringConvertible {
    var width: Double
    var height: Double
    var depth: Double

    /**
        Creates a size with double-precision zero values.
    */
    init() { 
        self.width = 0.0
        self.height = 0.0
        self.depth = 0.0
    }

    /**
        Creates a size from the specified double-precision values.
    */
    init(width: Double, height: Double, depth: Double) {
        self.width = width
        self.height = height
        self.depth = depth
    }

    /**
        Creates a size from the specified floating-point values.
    */
    init<T>(width: T, height: T, depth: T) where T : BinaryFloatingPoint {
        self.width = Double(width)
        self.height = Double(height)
        self.depth = Double(depth)
    }


    static var zero: SGSize {
        return SGSize()
    }

    var description: String {
        // let value: String = "SGSize<width: \(self.width), height: \(self.height), depth: \(self.depth)>"
        return "SGSize<width: \(self.width), height: \(self.height), depth: \(self.depth)>"
    }
}