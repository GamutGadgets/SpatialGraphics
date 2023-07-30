// init()
// Creates a rectangle structure.

// init(origin: simd_float3, size: simd_float3)
// Creates a rectangle at the specified origin with the specified size from single-precision vectors.

// init(origin: simd_double3, size: simd_double3)
// Creates a rectangle at the specified origin with the specified size from double-precision vectors.

// init(origin: Point3D, size: Size3D)
// Creates a rectangle at the specified origin and the specified size from Spatial structures.

// init(origin: Vector3D, size: Vector3D)
// Creates a rectangle with the specified origin and the specified size from Spatial vectors.

// init(center: simd_float3, size: simd_float3)
// Creates a rectangle with the specified center and the specified size from single-precision vectors.

// init(center: simd_double3, size: simd_double3)
// Creates a rectangle with the specified center and the specified size from double-precision vectors.

// init(center: Point3D, size: Size3D)
// Creates a rectangle with the specified center and the specified size from Spatial structures.

// init(center: Vector3D, size: Vector3D)
// Creates a rectangle with the specified center and the specified size from Spatial vectors.

// init(points: [Point3D])
// Creates a rectangle that’s the bounding box of the specified points.


// var origin: Point3D
// The origin of the rectangle.
// var center: Point3D
// The center of the rectangle.
// var size: Size3D
// The size of the rectangle.
// var cornerPoints: [Point3D]
// The corner points of the rectangle.
// var max: Point3D
// A point that represents the corner of the rectangle with the largest x-, y-, and z-coordinates.
// var min: Point3D
// A point that represents the corner of the rectangle with the smallest x-, y-, and z-coordinates.
// var description: String
// A textual representation of the instance.

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

    static func == (lhs: SGRect, rhs: SGRect) -> Bool {
        return lhs.size == rhs.size
    }

    
}

extension SGRect: SGScalable {
    mutating func scale(by size: SGSize) {
        self.size *= size
    }

    mutating func scaleBy(x: Double, y: Double, z: Double) {
        self.size = SGSize(width: self.size.width * x, height: self.size.height * y, depth: self.size.depth * z)
    }

    func scaled(by: SGSize) -> SGRect {
        return SGRect()
    }

    func scaledBy(x: Double, y: Double, z: Double) -> SGRect {
        return SGRect()
    }

    mutating func uniformlyScale(by: Double) {
        self.size = SGSize(width: self.size.width * by, height: self.size.height * by, depth: self.size.depth * by)
    }

    func uniformlyScaled(by: Double) -> SGRect {
        return SGRect()
    }



}