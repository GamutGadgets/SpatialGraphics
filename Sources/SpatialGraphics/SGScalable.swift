
protocol SGScalable {
    associatedtype Size3D

    func scale(by: Size3D)
    func scaleBy(x: Double, y: Double, z: Double)
    func scaled(by: Size3D) -> Self
    func scaledBy(x: Double, y: Double, z: Double) -> Self
    func uniformlyScale(by: Double)
    func uniformlyScaled(by: Double) -> Self
    func copyWith(scale: Size3D) -> Self
}

extension SGScalable {
    // func scale(by: SGSize) {
    //     scaleBy(width: by.width, height: Double, depth: Double)
    // }

    func scaleBy(x: Double, y: Double, z: Double) {
        // Since scaling might be specific to each type of object, no default implementation is provided here
    }

    func uniformlyScale(by: Double) {
        scaleBy(x: by, y: by, z: by)
    }

    func scaled(by: Size3D) -> Self {
        return copyWith(scale: by)
    }

    // func scaledBy(width: Double, height: Double, depth: Double) -> Self {
    //     return scaled(by: SGSize(width: Double, height: Double, depth: Double) as! Self.Size3D)
    // }

    func uniformlyScaled(by: Double) -> Self {
        return scaledBy(x: by, y: by, z: by)
    }
}
