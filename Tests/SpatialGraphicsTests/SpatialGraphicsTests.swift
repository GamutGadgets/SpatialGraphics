import XCTest
@testable import SpatialGraphics

final class SpatialGraphicsTests: XCTestCase {

    func testSGVector() throws {
        print("\nstart testSGVector\n")
        let vector: SGVector = .zero
        print(vector)
        print("\nend testSGVector\n")
    }

    func testSGAxis() throws {
        print("\nstart testSGAxis\n")
        let axis: SGAxis = SGAxis(rawValue: 0)
        print(axis)
        print("\nend testSGAxis\n")
    }

    func testSGAngle() throws {
        print("\nstart testSGAngle\n")
        print(SGAngle())
        print(SGAngle(degrees: 180.0))
        print(SGAngle(radians: Double.pi))

        let angleA: SGAngle = SGAngle(degrees: 180.0)
        let angleB: SGAngle = SGAngle(radians: Double.pi)
        assert(angleA + angleB == SGAngle(radians: 2 * Double.pi))
        print(angleA + angleB)
        assert(angleA - angleB == SGAngle(radians: 0.0))
        print(angleA - angleB)
        print("")

        let cosOfA: SGAngle = .cos(angleA)
        let sinOfA: SGAngle = .sin(angleA)
        
        print(cosOfA)
        print(sinOfA)

        print("\nend testSGAngle\n")
    }

    func testSGPoint() throws {
        print("\nstart testSGPoint\n")
        let point: SGPoint = .zero
        print(point)
        print("\nend testSGPoint\n")
    }

    func testSGRect() throws {
        print("\nstart testSGPoint\n")
        let rect: SGRect = SGRect()
        print(rect)
    }
}
