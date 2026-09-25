import Foundation

enum TabletType: String
{
    case iPad = "iPad"
    case android = "Android"
    case windows = "Windows"
}

class Tablet
{
    var model: String
    var screen: Double?
    var memory: Int?
    var type: TabletType

    init(model: String, screen: Double? = nil, memory: Int? = nil, type: TabletType)
    {
        self.model = model
        self.screen = screen
        self.memory = memory
        self.type = type
    }

    func describe() -> String
    {
        let screenText = screen.map { "\($0)\"" } ?? "unknown"
        let memoryText = memory.map { "\($0) GB" } ?? "unknown"

        let memoryTextWithCoalescing = memory.map { "\($0) GB" } ?? "unknown"

        return "Tablet: \(model) [\(type.rawValue)], screen: \(screenText), memory: \(memoryText) (checking with ??: \(memoryTextWithCoalescing))"
    }
}

func describeTablet(tablet: Tablet) -> String
{
    guard let screen = tablet.screen else
    {
        let memoryText = tablet.memory ?? 0

        return "Model: \(tablet.model) (\(tablet.type.rawValue)) — screen not specified, memory: \(memoryText) GB"
    }

    let memory = tablet.memory ?? 0

    return "Model: \(tablet.model) (\(tablet.type.rawValue)) — screen: \(screen)\", memory: \(memory) GB"
}

class User
{
    var name: String
    var tablet: Tablet?

    init(name: String, tablet: Tablet? = nil)
    {
        self.name = name
        self.tablet = tablet
    }

    func showTabletInfo()
    {
        if let userTablet = tablet
        {
            print("User \(name) has a tablet -> \(userTablet.describe())")
        }
        else
        {
            print("User \(name) does not have a tablet")
        }
    }
}

func runProgram()
{
    let tablet1 = Tablet(
        model: "iPad Pro 12.9",
        screen: 12.9,
        memory: 256,
        type: .iPad
    )

    let tablet2 = Tablet(
        model: "Samsung Galaxy Tab S9",
        screen: 11.0,
        memory: nil,
        type: .android
    )

    let tablet3 = Tablet(
        model: "Surface Pro 9",
        screen: nil,
        memory: 512,
        type: .windows
    )

    let tablet4 = Tablet(
        model: "Lenovo Tab M8",
        type: .android
    )

    let tablets: [Tablet] = [
        tablet1,
        tablet2,
        tablet3,
        tablet4
    ]

    print("=== Output using the separate describeTablet function ===")

    for t in tablets
    {
        print(describeTablet(tablet: t))
    }

    print("\n=== Output using the describe() class method ===")

    for t in tablets
    {
        print(t.describe())
    }

    print("\n=== User Information ===")

    let user1 = User(name: "Olena", tablet: tablet1)
    let user2 = User(name: "Maksym", tablet: nil)

    user1.showTabletInfo()
    user2.showTabletInfo()

    let modelsList: [String] = tablets.map { $0.model }

    let totalMemory: Int =
        tablets
            .compactMap { $0.memory }
            .reduce(0, +)

    let averageScreen: Double =
    {
        let screens = tablets.compactMap { $0.screen }

        return screens.isEmpty
            ? 0
            : screens.reduce(0, +) / Double(screens.count)
    }()

    print("\n=== Additional Statistics (Data Types) ===")
    print("List of models: \(modelsList)")
    print("Total known memory of all tablets: \(totalMemory) GB")
    print("Average screen size (where known): \(String(format: "%.2f", averageScreen))\"")

    for t in tablets
    {
        switch t.type
        {
        case .iPad:
            print("\(t.model) — this is an Apple product")

        case .android:
            print("\(t.model) — runs on Android")

        case .windows:
            print("\(t.model) — runs on Windows")
        }
    }
}
