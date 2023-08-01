import XCTest
@testable import SpatialGraphics
final class SpatialGraphicsTests: XCTestCase {

    // func testPhysics() throws {
    //     var simulation: SGPhysics = SGPhysics(dt: 0.0166666666666667)
    //     let startingPosition: SGPoint = SGPoint(x: 0.0, y: 0.0, z: 8.0)
    //     let objectA: SGObject = SGObject(at: startingPosition)
    //     let objectB: SGObject = SGObject(isAffectedByGravity: false)
    //     simulation.add(objectA)
    //     simulation.add(objectB)
        
    //     let duration: Double = 1.0

    //     while simulation.time <= duration {
    //         // objectA.move(by: SGVector(x: 0.0, y: 0.0, z: simulation.dg.z * -1))
    //         simulation.update()
    //     }
    // }

    func testSGVector() throws {
        print("\nstart testSGVector\n")
        let vector: SGVector = .zero
        print(vector)
        print("\nend testSGVector\n")
        let V1: SGVector = SGVector()
        let V2: SGVector = SGVector(x: 10.0, y: 10.0, z: 10.0)
        print("V1:\n\(V1)\n")
        print("V2:\n\(V2)\n")
        let sumOfV1andV2: SGVector = V1 + V2
        print("sumOfV1andV2:\n\(sumOfV1andV2)\n")
        let V3: SGVector = SGVector(x: 5.0, y: -10.0, z: 20.0)
        print("V3:\n\(V3)\n")
        let diffOfV2andV3: SGVector = V2 - V3
        print("diffOfV2andV3:\n\(diffOfV2andV3)\n")
        let scaledDiffOfV2andV3: SGVector = diffOfV2andV3.uniformlyScaled(by: Double.pi)
        print("scaledDiffOfV2andV3:\n\(scaledDiffOfV2andV3)\n")
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
        print("\nstart testSGRect\n")
        let rect: SGRect = SGRect()
        print(rect)

        let rect2: SGRect = SGRect(origin: SGPoint(x: 1.57, y: 7.21, z: 2.5), size: SGSize(width: 1.5, height: 5.2, depth: 3.2))
        print(rect2)
        print("\nend testSGRect\n")
    }

    func testSGVectorAddition() throws {
        let V1: SGVector = SGVector()
        let V2: SGVector = SGVector(x: 10.0, y: 10.0, z: 10.0)
        print("V1:\n\(V1)\n")
        print("V2:\n\(V2)\n")
        let sumOfV1andV2: SGVector = V1 + V2
        print("sumOfV1andV2:\n\(sumOfV1andV2)\n")
    }
}
