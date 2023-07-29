import Foundation

struct SGAxis: CustomStringConvertible {

    let rawValue: UInt32

    /**
        The operation is along the x-axis.
    */
    static let x = SGAxis(rawValue: 0)

    /**
        The operation is along the y-axis.
    */
    static let y = SGAxis(rawValue: 1)

    /**
        The operation is along the z-axis.
    */
    static let z = SGAxis(rawValue: 2)

    /**
        Creates a new instance with the specified raw value.
    */
    init(rawValue: UInt32) {
        if rawValue > 2 { self.rawValue = 0 }
        else { self.rawValue = rawValue }
    }

    var description: String {
        var axis: String  {
            if self.rawValue == 0 { return "x-axis" }
            else if self.rawValue == 1 { return "y-axis" }
            else { return "z-axis" }
        }
        return "SGAxis: \(axis)"
    }
}