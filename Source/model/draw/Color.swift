import Foundation

public final class Color: Fill { //}, Equatable {

    public let val: Int

    public static let white: Color = Color( val: 0xFFFFFF )
    public static let silver: Color = Color( val: 0xC0C0C0 )
    public static let gray: Color = Color( val: 0x808080 )
    public static let black: Color = Color( val: 0 )
    public static let red: Color = Color( val: 0xFF0000 )
    public static let maroon: Color = Color( val: 0x800000 )
    public static let yellow: Color = Color( val: 0xFFFF00 )
    public static let olive: Color = Color( val: 0x808000 )
    public static let lime: Color = Color( val: 0x00FF00 )
    public static let green: Color = Color( val: 0x008000 )
    public static let aqua: Color = Color( val: 0x00FFFF )
    public static let teal: Color = Color( val: 0x008080 )
    public static let blue: Color = Color( val: 0x0000FF )
    public static let navy: Color = Color( val: 0x000080 )
    public static let fuchsia: Color = Color( val: 0xFF00FF )
    public static let purple: Color = Color( val: 0x800080 )
    public static let clear: Color = Color.rgba(r: 0, g: 0, b: 0, a: 0)

    public init(val: Int = 0) {
        self.val = val
    }

    // GENERATED
    public func r() -> Int {
        return ( ( val >> 16 ) & 0xff )
    }

    // GENERATED
    public func g() -> Int {
        return ( ( val >> 8 ) & 0xff )
    }

    // GENERATED
    public func b() -> Int {
        return ( val & 0xff )
    }

    // GENERATED
    public func a() -> Int {
        return ( 255 - ( ( val >> 24 ) & 0xff ) )
    }

    // GENERATED
    public func with(a: Double) -> Color {
        return Color.rgba(r: r(), g: g(), b: b(), a: a)
    }

    // GENERATED
    public class func rgbt(r: Int, g: Int, b: Int, t: Int) -> Color {
        let x = ( ( t & 0xff ) << 24 )
        let y = ( ( r & 0xff ) << 16 )
        let z = ( ( g & 0xff ) << 8 )
        let q = b & 0xff
        return Color( val: ( ( ( x | y ) | z ) | q ) )
    }

    // GENERATED
    public class func rgba(r: Int, g: Int, b: Int, a: Double) -> Color {
        return rgbt( r: r, g: g, b: b, t: Int( ( ( 1 - a ) * 255 ) ) )
    }

    // GENERATED
    public class func rgb(r: Int, g: Int, b: Int) -> Color {
        return rgbt( r: r, g: g, b: b, t: 0 )
    }

    public static func == (lhs: Color, rhs: Color) -> Bool {
        return lhs.val == rhs.val
    }
}

extension Color {

    func removingColors() -> Color {
        return Color.black.with(a: Double(a()) / 255.0)
    }

    func desaturated() -> Color {
        let grey = Int(0.21 * .init(r()) + 0.72 * .init(g()) + 0.07 * .init(b()))
        return Color.rgb(r: grey, g: grey, b: grey)
    }
}


//public final class Color: Fill {
//    public static let white = Color(0xFF, 0xFF, 0xFF, 0xFF)
//    public static let red   = Color(0xFF, 0x00, 0x00, 0xFF)
//    public static let green = Color(0x00, 0xFF, 0x00, 0xFF)
//    public static let blue  = Color(0x00, 0x00, 0xFF, 0xFF)
//    public static let black = Color(0x00, 0x00, 0x00, 0xFF)
//    public static let clear = Color(0x00, 0x00, 0x00, 0x00)
//
//    private var value: Int
//
//    public var a: Int { return (value >> 24) & 0xFF }
//    public var r: Int { return (value >> 16) & 0xFF }
//    public var g: Int { return (value >>  8) & 0xFF }
//    public var b: Int { return (value >>  0) & 0xFF }
//
//    public init<T: FixedWidthInteger>(
//        _ r: T,
//        _ g: T,
//        _ b: T,
//        _ a: T = 0xFF
//    ) {
//        let (a, r, g, b) = (
//            (a & 0xFF) << 24,
//            (r & 0xFF) << 16,
//            (g & 0xFF) << 8,
//            (b & 0xFF))
//        value = .init(a | r | g | b)
//    }
//
//    public convenience init<T: FixedWidthInteger>(
//        _ r: T, _ g: T, _ b: T, _ a: Double
//    ) {
//        self.init(r, g, b, T(a * 255.0))
//    }
//
//    public convenience init(_ cs: [Int]) {
//        var it = cs.makeIterator()
//        self.init(
//            it.next() ?? 0,
//            it.next() ?? 0,
//            it.next() ?? 0,
//            it.next() ?? 0xFF)
//    }
//
//    public func with(a: Double) -> Color {
//        return .init(r, g, b, a)
//    }
//
//    override func equals<T>(other: T) -> Bool where T: Color {
//        return value == other.value
//    }
//}
//
//extension Color {
//
//    func removingColors() -> Color {
//        return Color.black.with(a: Double(a) / 255.0)
//    }
//
//    func desaturated() -> Color {
//        let grey = Int(0.21 * .init(r) + 0.72 * .init(g) + 0.07 * .init(b))
//        return Color(grey, grey, grey)
//    }
//}
//
//extension Color: CustomStringConvertible {
//
//    public var description: String {
//        return "Macaw.Color(\(r),\(g),\(b),\(a))"
//    }
//}
