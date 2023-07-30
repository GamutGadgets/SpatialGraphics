
protocol SGScalable {
    // associatedtype SGSize

    mutating func scale(by size: SGSize)
    mutating func scaleBy(x: Double, y: Double, z: Double)
    func scaled(by: SGSize) -> Self
    func scaledBy(x: Double, y: Double, z: Double) -> Self
    mutating func uniformlyScale(by: Double)
    func uniformlyScaled(by: Double) -> Self

}

