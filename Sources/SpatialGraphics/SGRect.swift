import Foundation

struct SGRect: CustomStringConvertible {

    var origin: SGPoint

    var center: SGPoint

    var size: SGSize

    var cornerPoints: [SGPoint]

    var max: SGPoint

    var min: SGPoint

    var description: String {
        var pointsDescription: String = "{\n        "
        for p in 0..<self.cornerPoints.count {
            pointsDescription += self.cornerPoints[p].description
            if p != self.cornerPoints.count - 1 {
                pointsDescription += ",\n        "
            } else {
                pointsDescription += "\n    }        "
            }
        }
        return "SGRect {\n    origin: \(self.origin),\n    center: \(self.center),\n    size: \(self.size)\n    corners: \(pointsDescription),\n    max: \(self.max),\n    min: \(self.min)\n}"
    }

    init() {
        self.origin = .init()
        self.center = .init()
        self.size = .init()
        self.cornerPoints = []
        self.max = .init()
        self.min = .init()
    }

    init(origin: SGPoint, size: SGSize) {
        self.origin = origin
        self.size = size
        self.center = SGRect.center(origin: origin, size: size)
        self.cornerPoints = SGRect.cornerPoints(origin: origin, size: size).sorted()
        if !self.cornerPoints.isEmpty {
            self.min = self.cornerPoints.first!
            if self.cornerPoints.count > 1 { self.max = self.cornerPoints.last! } 
            else { self.max = self.cornerPoints.first! }
        } else {
            self.min = .init(point: origin)
            self.max = .init(point: origin)
        }
    }

    static var zero: SGRect { return .init() }

    static func center(origin: SGPoint, size: SGSize) -> SGPoint {
        let xC: Double = size.width / 2.0
        let yC: Double = size.height / 2.0
        let zC: Double = size.depth / 2.0
        return SGPoint(x: xC + origin.x, y: yC + origin.y, z: zC + origin.z)

    }

    static func cornerPoints(origin: SGPoint, size: SGSize) -> [SGPoint] {
        let p1: SGPoint = SGPoint(point: origin)
        let p2: SGPoint = SGPoint(x: origin.x + size.width, y: origin.y, z: origin.z)
        let p3: SGPoint = SGPoint(x: origin.x, y: origin.y + size.height, z: origin.z)
        let p4: SGPoint = SGPoint(x: origin.x + size.width, y: origin.y + size.height, z: origin.z)
        if origin.z == size.depth {
            return [p1, p2, p3, p4]
        } else {
            let p5: SGPoint = SGPoint(x: origin.x, y: origin.y, z: origin.z + size.depth)
            let p6: SGPoint = SGPoint(x: origin.x + size.width, y: origin.y, z: origin.z + size.depth)
            let p7: SGPoint = SGPoint(x: origin.x, y: origin.y + size.height, z: origin.z + size.depth)
            let p8: SGPoint = SGPoint(x: origin.x + size.width, y: origin.y + size.height, z: origin.z + size.depth)
            return [
                p1, p2, p3, p4,
                p5, p6, p7, p8
            ]
        }
    }
}

extension SGRect: AdditiveArithmetic {
    static func - (lhs: SGRect, rhs: SGRect) -> SGRect {
        let sizeWidth: Double = lhs.size.width - rhs.size.width
        let sizeHeight: Double = lhs.size.height - rhs.size.height
        let sizeDepth: Double = lhs.size.depth - rhs.size.depth
        return SGRect(origin: lhs.origin, size: SGSize(width: sizeWidth, height: sizeHeight, depth: sizeDepth))
    }

    static func + (lhs: SGRect, rhs: SGRect) -> SGRect {
        let sizeWidth: Double = lhs.size.width + rhs.size.width
        let sizeHeight: Double = lhs.size.height + rhs.size.height
        let sizeDepth: Double = lhs.size.depth + rhs.size.depth
        return SGRect(origin: lhs.origin, size: SGSize(width: sizeWidth, height: sizeHeight, depth: sizeDepth))
    }

    
}

extension SGRect: Comparable {

    static func < (lhs: SGRect, rhs: SGRect) -> Bool {
        return (lhs.size.magnitude < rhs.size.magnitude) && (lhs.center < rhs.center)
    }

    static func == (lhs: SGRect, rhs: SGRect) -> Bool {
        return (lhs.size.magnitude == rhs.size.magnitude) && (lhs.center == rhs.center)
    }
}

extension SGRect: SGScalable {

    private mutating func updateFromSizeScale(scaledSize: SGSize) {
        self.size = scaledSize
        self.center = SGRect.center(origin: self.origin, size: scaledSize)
        self.cornerPoints = SGRect.cornerPoints(origin: self.origin, size: scaledSize).sorted()
        if !self.cornerPoints.isEmpty {
            self.min = self.cornerPoints.first!
            if self.cornerPoints.count > 1 { self.max = self.cornerPoints.last! } 
            else { self.max = self.cornerPoints.first! }
        } else {
            self.min = .init(point: origin)
            self.max = .init(point: origin)
        }
    }

    mutating func scale(by size: SGSize) {
        let scaledSize: SGSize = SGSize(width: self.size.width * size.width, height: self.size.height * size.height, depth: self.size.depth * size.depth)
        self.updateFromSizeScale(scaledSize: scaledSize)
    }

    mutating func scaleBy(x: Double, y: Double, z: Double) {
        let scaledSize: SGSize = SGSize(width: self.size.width * x, height: self.size.height * y, depth: self.size.depth * z)
        self.updateFromSizeScale(scaledSize: scaledSize)
    }

    func scaled(by: SGSize) -> SGRect {
        let scaledSize: SGSize = SGSize(width: self.size.width * by.width, height: self.size.height * by.height, depth: self.size.depth * by.depth)
        return SGRect(origin: self.origin, size: scaledSize)
    }

    func scaledBy(x: Double, y: Double, z: Double) -> SGRect {
        let scaledSize: SGSize = SGSize(width: self.size.width * x, height: self.size.height * y, depth: self.size.depth * z)
        return SGRect(origin: self.origin, size: scaledSize)
    }

    mutating func uniformlyScale(by magnitude: Double) {
        self.updateFromSizeScale(
            scaledSize: SGSize(
                width: self.size.width * magnitude,
                height: self.size.height * magnitude,
                depth: self.size.depth * magnitude
            )
        )
    }

    func uniformlyScaled(by magnitude: Double) -> SGRect {
        let scaledSize: SGSize = SGSize(
                width: self.size.width * magnitude,
                height: self.size.height * magnitude,
                depth: self.size.depth * magnitude
            )
        return SGRect(origin: self.origin, size: scaledSize)
    }



}