import Foundation

struct SGAngle: CustomStringConvertible, AdditiveArithmetic, Equatable {
    /**
        The angle in degrees.
    */
    var degrees: Double

    /**
        The angle in radians.
    */
    var radians: Double

    /**
        A textual representation of the instance.
    */
    var description: String {
        return "SGAngle(radians: \(self.radians), degrees: \(self.degrees))"
    }

    // Add a small constant for comparison
    let epsilon: Double = 1e-14

    /**
        Creates an angle.
    */
    init() {
        self.degrees = 0.0
        self.radians = 0.0
    }

    /**
        Creates an angle with the specified double-precision radians.
    */
    init(radians: Double) {
        self.radians = abs(radians) < epsilon ? 0 : radians
        self.degrees = abs(radians * 180.0 / Double.pi) < epsilon ? 0 : radians * 180.0 / Double.pi
    }

    /**
        Creates an angle with the specified floating-point radians.
    */
    init<T>(radians: T) where T : BinaryFloatingPoint {
        let convertedType: Double = Double(radians)
        self.radians = abs(convertedType) < epsilon ? 0 : convertedType
        self.degrees = abs(convertedType * 180.0 / Double.pi) < epsilon ? 0 : convertedType * 180.0 / Double.pi
    }

    /**
        Creates an angle with the specified double-precision degrees.
    */
    init(degrees: Double) {
        self.degrees = degrees
        self.radians = degrees * Double.pi / 180
    }

    /**
        Creates an angle with the specified floating-point degrees.
    */
    init<T>(degrees: T) where T : BinaryFloatingPoint {
        let convertedType: Double = Double(degrees)
        self.degrees = convertedType
        self.radians = convertedType * Double.pi / 180
    }

    /**
        Returns a new angle structure with the specified double-precision degrees.
    */
    static func degrees(_ value: Double) -> SGAngle {
        return SGAngle(degrees: value)
    }

    /**
        Returns a new angle structure with the specified double-precision radians.
    */
    static func radians(_ value: Double) -> SGAngle {
        return SGAngle(radians: value)
    }

    /**
        Creates a new instance with the specified raw value.
    */
    static var zero: SGAngle { return SGAngle() }

    /**
        Creates a new instance with the specified raw value.
    */
    static func - (lhs: SGAngle, rhs: SGAngle) -> SGAngle {
        return SGAngle(radians: lhs.radians - rhs.radians)
    }

    /**
        Creates a new instance with the specified raw value.
    */
    static func + (lhs: SGAngle, rhs: SGAngle) -> SGAngle {
        return SGAngle(radians: lhs.radians + rhs.radians)
    }

    static func == (lhs: SGAngle, rhs: SGAngle) -> Bool {
        return lhs.radians == rhs.radians
    }

    /**
        Returns the cosine of the specified angle.
    */
    static func cos(_ angle: SGAngle) -> SGAngle {
        return SGAngle(radians: abs(Foundation.cos(angle.radians)) < angle.epsilon ? 0 : Foundation.cos(angle.radians))
    }

    /**
        Returns the hyperbolic cosine of the specified angle.
    */
    static func cosh(_ angle: SGAngle) -> SGAngle {
        return SGAngle(radians: abs(Foundation.cosh(angle.radians)) < angle.epsilon ? 0 : Foundation.cosh(angle.radians))
    }

    /**
        Returns the sine of the specified angle.
    */
    static func sin(_ angle: SGAngle) -> SGAngle {
        return SGAngle(radians: abs(Foundation.sin(angle.radians)) < angle.epsilon ? 0 : Foundation.sin(angle.radians))
    }

    /**
        Returns the hyperbolic sine of the specified angle.
    */
    static func sinh(_ angle: SGAngle) -> SGAngle {
        return SGAngle(radians: abs(Foundation.sinh(angle.radians)) < angle.epsilon ? 0 : Foundation.sinh(angle.radians))
    }

    /**
        Returns the tangent of the specified angle.
    */
    static func tan(_ angle: SGAngle) -> SGAngle {
        return SGAngle(radians: abs(Foundation.tan(angle.radians)) < angle.epsilon ? 0 : Foundation.tan(angle.radians))
    }
    
    /**
        Returns the hyperbolic tangent of the specified angle.
    */
    static func tanh(_ angle: SGAngle) -> SGAngle {
        return SGAngle(radians: abs(Foundation.tanh(angle.radians)) < angle.epsilon ? 0 : Foundation.tanh(angle.radians))
    }

    /**
        Returns the inverse cosine of the specified angle.
    */
    static func acos(_ angle: SGAngle) -> SGAngle {
        return SGAngle(radians: abs(Foundation.acos(angle.radians)) < angle.epsilon ? 0 : Foundation.acos(angle.radians))
    }

    /**
        Returns the inverse hyperbolic cosine of the specified angle.
    */
    static func acosh(_ angle: SGAngle) -> SGAngle {
       return SGAngle(radians: abs(Foundation.acosh(angle.radians)) < angle.epsilon ? 0 : Foundation.acosh(angle.radians))
    }

    /**
        Returns the inverse sine of the specified angle.
    */
    static func asin(_ angle: SGAngle) -> SGAngle {
        return SGAngle(radians: abs(Foundation.asin(angle.radians)) < angle.epsilon ? 0 : Foundation.asin(angle.radians))
    }

    /**
        Returns the inverse hyperbolic sine of the specified angle.
    */
    static func asinh(_ angle: SGAngle) -> SGAngle {
        return SGAngle(radians: abs(Foundation.asinh(angle.radians)) < angle.epsilon ? 0 : Foundation.asinh(angle.radians))
    }

    /**
        Returns the inverse tangent of the specified angle.
    */
    static func atan(_ angle: SGAngle) -> SGAngle {
        return SGAngle(radians: abs(Foundation.atan(angle.radians)) < angle.epsilon ? 0 : Foundation.atan(angle.radians))
    }
    
    /**
        Returns the inverse hyperbolic tangent of the specified angle.
    */
    static func atanh(_ angle: SGAngle) -> SGAngle {
        return SGAngle(radians: abs(Foundation.atanh(angle.radians)) < angle.epsilon ? 0 : Foundation.atanh(angle.radians))
    }
}
