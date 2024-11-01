import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "backdrop" asset catalog image resource.
    static let backdrop = DeveloperToolsSupport.ImageResource(name: "backdrop", bundle: resourceBundle)

    /// The "background" asset catalog image resource.
    static let background = DeveloperToolsSupport.ImageResource(name: "background", bundle: resourceBundle)

    /// The "blakeprofile" asset catalog image resource.
    static let blakeprofile = DeveloperToolsSupport.ImageResource(name: "blakeprofile", bundle: resourceBundle)

    /// The "favorite" asset catalog image resource.
    static let favorite = DeveloperToolsSupport.ImageResource(name: "favorite", bundle: resourceBundle)

    /// The "favorite2" asset catalog image resource.
    static let favorite2 = DeveloperToolsSupport.ImageResource(name: "favorite2", bundle: resourceBundle)

    /// The "favorite3" asset catalog image resource.
    static let favorite3 = DeveloperToolsSupport.ImageResource(name: "favorite3", bundle: resourceBundle)

    /// The "golden-logo-1024" asset catalog image resource.
    static let goldenLogo1024 = DeveloperToolsSupport.ImageResource(name: "golden-logo-1024", bundle: resourceBundle)

    /// The "image" asset catalog image resource.
    static let image = DeveloperToolsSupport.ImageResource(name: "image", bundle: resourceBundle)

    /// The "image2" asset catalog image resource.
    static let image2 = DeveloperToolsSupport.ImageResource(name: "image2", bundle: resourceBundle)

    /// The "image3" asset catalog image resource.
    static let image3 = DeveloperToolsSupport.ImageResource(name: "image3", bundle: resourceBundle)

    /// The "image4" asset catalog image resource.
    static let image4 = DeveloperToolsSupport.ImageResource(name: "image4", bundle: resourceBundle)

    /// The "jackprofile" asset catalog image resource.
    static let jackprofile = DeveloperToolsSupport.ImageResource(name: "jackprofile", bundle: resourceBundle)

    /// The "joshprofile" asset catalog image resource.
    static let joshprofile = DeveloperToolsSupport.ImageResource(name: "joshprofile", bundle: resourceBundle)

    /// The "kennprofile" asset catalog image resource.
    static let kennprofile = DeveloperToolsSupport.ImageResource(name: "kennprofile", bundle: resourceBundle)

    /// The "leeprofile" asset catalog image resource.
    static let leeprofile = DeveloperToolsSupport.ImageResource(name: "leeprofile", bundle: resourceBundle)

    /// The "profile" asset catalog image resource.
    static let profile = DeveloperToolsSupport.ImageResource(name: "profile", bundle: resourceBundle)

    /// The "roryprofile" asset catalog image resource.
    static let roryprofile = DeveloperToolsSupport.ImageResource(name: "roryprofile", bundle: resourceBundle)

    /// The "test" asset catalog image resource.
    static let test = DeveloperToolsSupport.ImageResource(name: "test", bundle: resourceBundle)

    /// The "test2" asset catalog image resource.
    static let test2 = DeveloperToolsSupport.ImageResource(name: "test2", bundle: resourceBundle)

    /// The "test3" asset catalog image resource.
    static let test3 = DeveloperToolsSupport.ImageResource(name: "test3", bundle: resourceBundle)

    /// The "test4" asset catalog image resource.
    static let test4 = DeveloperToolsSupport.ImageResource(name: "test4", bundle: resourceBundle)

    /// The "test5" asset catalog image resource.
    static let test5 = DeveloperToolsSupport.ImageResource(name: "test5", bundle: resourceBundle)

    /// The "test6" asset catalog image resource.
    static let test6 = DeveloperToolsSupport.ImageResource(name: "test6", bundle: resourceBundle)

    /// The "test7" asset catalog image resource.
    static let test7 = DeveloperToolsSupport.ImageResource(name: "test7", bundle: resourceBundle)

    /// The "zacprofile" asset catalog image resource.
    static let zacprofile = DeveloperToolsSupport.ImageResource(name: "zacprofile", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "backdrop" asset catalog image.
    static var backdrop: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .backdrop)
#else
        .init()
#endif
    }

    /// The "background" asset catalog image.
    static var background: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .background)
#else
        .init()
#endif
    }

    /// The "blakeprofile" asset catalog image.
    static var blakeprofile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .blakeprofile)
#else
        .init()
#endif
    }

    /// The "favorite" asset catalog image.
    static var favorite: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .favorite)
#else
        .init()
#endif
    }

    /// The "favorite2" asset catalog image.
    static var favorite2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .favorite2)
#else
        .init()
#endif
    }

    /// The "favorite3" asset catalog image.
    static var favorite3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .favorite3)
#else
        .init()
#endif
    }

    /// The "golden-logo-1024" asset catalog image.
    static var goldenLogo1024: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .goldenLogo1024)
#else
        .init()
#endif
    }

    /// The "image" asset catalog image.
    static var image: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .image)
#else
        .init()
#endif
    }

    /// The "image2" asset catalog image.
    static var image2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .image2)
#else
        .init()
#endif
    }

    /// The "image3" asset catalog image.
    static var image3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .image3)
#else
        .init()
#endif
    }

    /// The "image4" asset catalog image.
    static var image4: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .image4)
#else
        .init()
#endif
    }

    /// The "jackprofile" asset catalog image.
    static var jackprofile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .jackprofile)
#else
        .init()
#endif
    }

    /// The "joshprofile" asset catalog image.
    static var joshprofile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .joshprofile)
#else
        .init()
#endif
    }

    /// The "kennprofile" asset catalog image.
    static var kennprofile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .kennprofile)
#else
        .init()
#endif
    }

    /// The "leeprofile" asset catalog image.
    static var leeprofile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .leeprofile)
#else
        .init()
#endif
    }

    /// The "profile" asset catalog image.
    static var profile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .profile)
#else
        .init()
#endif
    }

    /// The "roryprofile" asset catalog image.
    static var roryprofile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .roryprofile)
#else
        .init()
#endif
    }

    /// The "test" asset catalog image.
    static var test: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .test)
#else
        .init()
#endif
    }

    /// The "test2" asset catalog image.
    static var test2: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .test2)
#else
        .init()
#endif
    }

    /// The "test3" asset catalog image.
    static var test3: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .test3)
#else
        .init()
#endif
    }

    /// The "test4" asset catalog image.
    static var test4: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .test4)
#else
        .init()
#endif
    }

    /// The "test5" asset catalog image.
    static var test5: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .test5)
#else
        .init()
#endif
    }

    /// The "test6" asset catalog image.
    static var test6: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .test6)
#else
        .init()
#endif
    }

    /// The "test7" asset catalog image.
    static var test7: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .test7)
#else
        .init()
#endif
    }

    /// The "zacprofile" asset catalog image.
    static var zacprofile: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .zacprofile)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "backdrop" asset catalog image.
    static var backdrop: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .backdrop)
#else
        .init()
#endif
    }

    /// The "background" asset catalog image.
    static var background: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .background)
#else
        .init()
#endif
    }

    /// The "blakeprofile" asset catalog image.
    static var blakeprofile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .blakeprofile)
#else
        .init()
#endif
    }

    /// The "favorite" asset catalog image.
    static var favorite: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .favorite)
#else
        .init()
#endif
    }

    /// The "favorite2" asset catalog image.
    static var favorite2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .favorite2)
#else
        .init()
#endif
    }

    /// The "favorite3" asset catalog image.
    static var favorite3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .favorite3)
#else
        .init()
#endif
    }

    /// The "golden-logo-1024" asset catalog image.
    static var goldenLogo1024: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .goldenLogo1024)
#else
        .init()
#endif
    }

    /// The "image" asset catalog image.
    static var image: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .image)
#else
        .init()
#endif
    }

    /// The "image2" asset catalog image.
    static var image2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .image2)
#else
        .init()
#endif
    }

    /// The "image3" asset catalog image.
    static var image3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .image3)
#else
        .init()
#endif
    }

    /// The "image4" asset catalog image.
    static var image4: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .image4)
#else
        .init()
#endif
    }

    /// The "jackprofile" asset catalog image.
    static var jackprofile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .jackprofile)
#else
        .init()
#endif
    }

    /// The "joshprofile" asset catalog image.
    static var joshprofile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .joshprofile)
#else
        .init()
#endif
    }

    /// The "kennprofile" asset catalog image.
    static var kennprofile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .kennprofile)
#else
        .init()
#endif
    }

    /// The "leeprofile" asset catalog image.
    static var leeprofile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .leeprofile)
#else
        .init()
#endif
    }

    /// The "profile" asset catalog image.
    static var profile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .profile)
#else
        .init()
#endif
    }

    /// The "roryprofile" asset catalog image.
    static var roryprofile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .roryprofile)
#else
        .init()
#endif
    }

    /// The "test" asset catalog image.
    static var test: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .test)
#else
        .init()
#endif
    }

    /// The "test2" asset catalog image.
    static var test2: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .test2)
#else
        .init()
#endif
    }

    /// The "test3" asset catalog image.
    static var test3: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .test3)
#else
        .init()
#endif
    }

    /// The "test4" asset catalog image.
    static var test4: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .test4)
#else
        .init()
#endif
    }

    /// The "test5" asset catalog image.
    static var test5: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .test5)
#else
        .init()
#endif
    }

    /// The "test6" asset catalog image.
    static var test6: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .test6)
#else
        .init()
#endif
    }

    /// The "test7" asset catalog image.
    static var test7: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .test7)
#else
        .init()
#endif
    }

    /// The "zacprofile" asset catalog image.
    static var zacprofile: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .zacprofile)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

