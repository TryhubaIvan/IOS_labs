enum TabletType
{
    case ios, Android, Windows
}

class Tablet
{
    var model: String
    var screen: Double?
    var memory: Int?
    var type: TabletType
    var width: Int
    var height: Int
    
    var ppi: Double
    {
        Double(width * height) / (screen ?? 1)
    }
    
    init(model: String, screen: Double?, memory: Int?, type: TabletType, width: Int, height: Int)
    {
        self.model = model
        self.screen = screen
        self.memory = memory
        self.type = type
        self.width = width
        self.height = height
    }
    
    func describe()
    {
        let screenText = screen.map { "\($0) inch" } ?? "unknown screen"
        let memoryText = memory.map { "\($0) GB" } ?? "unknown memory"
        print("\(model): \(screenText), \(memoryText), \(ppi)")
    }
}

func describeTablet(tablet: Tablet)
{
    guard let screen = tablet.screen, let memory = tablet.memory else
    {
        print("\(tablet.model): \(tablet.screen ?? 0) inch, \(tablet.memory ?? 0) GB, \(tablet.ppi)")
        return
    }
    
    print("\(tablet.model): \(screen) inch, \(memory) GB")
}

class User
{
    var name: String
    var tablet: Tablet?
    
    init(name: String, tablet: Tablet?)
    {
        self.name = name
        self.tablet = tablet
    }
    
    func showTablet()
    {
        if let tablet = tablet
        {
            print("\(name)'s tablet:")
            tablet.describe()
        }
        else
        {
            print("\(name) has no tablet")
        }
    }
}

let ipad = Tablet(
    model: "iPad",
    screen: 10.9,
    memory: 256,
    type: .ios,
    width: 720,
    height: 1280
)

let samsungPhone = Tablet(
    model: "Samsung",
    screen: 11.0,
    memory: nil,
    type: .Android,
    width: 1080,
    height: 1920
    
)

let xiaomiTablet = Tablet(
    model: "Xiaomi",
    screen: nil,
    memory: 512,
    type: .Windows,
    width: 1440,
    height: 2560
)

let tablets: [Tablet] = [ipad, samsungPhone, xiaomiTablet]

print("-- DESCRIBE --")
for tablet in tablets
{
    describeTablet(tablet: tablet)
}

print("-- DESCRIBE --")
for tablet in tablets
{
    tablet.describe()
}

print("--- ---")

let user = User(name: "Alex", tablet: ipad)
user.showTablet()

let userWithoutTablet = User(name: "John", tablet: nil)
userWithoutTablet.showTablet()
