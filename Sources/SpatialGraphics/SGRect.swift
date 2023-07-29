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
        return "SGRect{\n\torigin: \(self.origin),\n\tcenter: \(self.center),\n\tsize: \(self.size)\n}"
    }

    init() {
        self.origin = .init()
        self.center = .init()
        self.size = .init()
        self.cornerPoints = []
        self.max = .init()
        self.min = .init()
    }

    static func scaled(by scale: SGSize) {

    }

}