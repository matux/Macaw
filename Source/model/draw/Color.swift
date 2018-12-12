public final class Color: Fill {
    public static let white = Color(0xFFFFFFFF)
    public static let red   = Color(0xFF0000FF)
    public static let black = Color(0x000000FF)
    public static let clear = Color(0)

    private var value: Int

    public var a: Int { return (value >> 24) & 0xFF }
    public var r: Int { return (value >> 16) & 0xFF }
    public var g: Int { return (value >> 8) & 0xFF }
    public var b: Int { return value & 0xFF }

    public init(_ value: Int) {
        self.value = value
    }

    public init<T: FixedWidthInteger>(_ r: T, _ g: T, _ b: T, _ a: T = 255) {
        let (a, r, g, b) = (
            (Int(a) & 0xFF) << 24,
            (Int(r) & 0xFF) << 16,
            (Int(g) & 0xFF) << 8,
            (Int(b) & 0xFF))
        value = a | r | g | b
    }

    public convenience init<T: FixedWidthInteger>(
        _ r: T, _ g: T, _ b: T, _ a: Double
    ) {
        self.init(r, g, b, T(a * 255.0))
    }

    public convenience init(_ cs: [Int]) {
        var it = cs.makeIterator()
        self.init(it.next() ?? 0, it.next() ?? 0, it.next() ?? 0, it.next() ?? 0)
    }

    public func with(a: Double) -> Color {
        return .init(r, g, b, Int(a * 255.0))
    }

    override func equals<T>(other: T) -> Bool where T: Color {
        return value == other.value
    }
}

extension Color {

    func removingColors() -> Color {
        return Color.black.with(a: Double(a) / 255.0)
    }

    func desaturated() -> Color {
        let grey = Int(0.21 * Double(r) + 0.72 * Double(g) + 0.07 * Double(b))
        return Color(grey, grey, grey)
    }
}

extension Color: CustomStringConvertible {

    public var description: String {
        return "Macaw.Color(\(r),\(g),\(b),\(a))"
    }
}
