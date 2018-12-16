//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 4 files.
  struct file {
    /// Resource file `DEBUG.plist`.
    static let debugPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "DEBUG", pathExtension: "plist")
    /// Resource file `RELEASE.plist`.
    static let releasePlist = Rswift.FileResource(bundle: R.hostingBundle, name: "RELEASE", pathExtension: "plist")
    /// Resource file `STAGING.plist`.
    static let stagingPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "STAGING", pathExtension: "plist")
    /// Resource file `photos`.
    static let photos = Rswift.FileResource(bundle: R.hostingBundle, name: "photos", pathExtension: "")
    
    /// `bundle.url(forResource: "DEBUG", withExtension: "plist")`
    static func debugPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.debugPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "RELEASE", withExtension: "plist")`
    static func releasePlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.releasePlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "STAGING", withExtension: "plist")`
    static func stagingPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.stagingPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "photos", withExtension: "")`
    static func photos(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.photos
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 0 images.
  struct image {
    /// This `R.image.launchScreen` struct is generated, and contains static references to 1 images.
    struct launchScreen {
      /// Image `launch_screen`.
      static let launch_screen = Rswift.ImageResource(bundle: R.hostingBundle, name: "LaunchScreen/launch_screen")
      
      /// `UIImage(named: "launch_screen", bundle: ..., traitCollection: ...)`
      static func launch_screen(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.launchScreen.launch_screen, compatibleWith: traitCollection)
      }
      
      fileprivate init() {}
    }
    
    /// This `R.image.trendDetail` struct is generated, and contains static references to 1 images.
    struct trendDetail {
      /// Image `close`.
      static let close = Rswift.ImageResource(bundle: R.hostingBundle, name: "TrendDetail/close")
      
      /// `UIImage(named: "close", bundle: ..., traitCollection: ...)`
      static func close(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
        return UIKit.UIImage(resource: R.image.trendDetail.close, compatibleWith: traitCollection)
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `TrendPhotoCell`.
    static let trendPhotoCell: Rswift.ReuseIdentifier<TrendPhotoCell> = Rswift.ReuseIdentifier(identifier: "TrendPhotoCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `TrendDetail`.
    static let trendDetail = _R.storyboard.trendDetail()
    /// Storyboard `Trends`.
    static let trends = _R.storyboard.trends()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "TrendDetail", bundle: ...)`
    static func trendDetail(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.trendDetail)
    }
    
    /// `UIStoryboard(name: "Trends", bundle: ...)`
    static func trends(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.trends)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try trendDetail.validate()
      try trends.validate()
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "LaunchScreen/launch_screen") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'LaunchScreen/launch_screen' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct trendDetail: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "TrendDetail"
      let trendDetailController = StoryboardViewControllerResource<TrendDetailController>(identifier: "TrendDetailController")
      
      func trendDetailController(_: Void = ()) -> TrendDetailController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: trendDetailController)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "TrendDetail/close") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'TrendDetail/close' is used in storyboard 'TrendDetail', but couldn't be loaded.") }
        if _R.storyboard.trendDetail().trendDetailController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'trendDetailController' could not be loaded from storyboard 'TrendDetail' as 'TrendDetailController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct trends: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let name = "Trends"
      let trendPhotosController = StoryboardViewControllerResource<UIKit.UINavigationController>(identifier: "TrendPhotosController")
      
      func trendPhotosController(_: Void = ()) -> UIKit.UINavigationController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: trendPhotosController)
      }
      
      static func validate() throws {
        if _R.storyboard.trends().trendPhotosController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'trendPhotosController' could not be loaded from storyboard 'Trends' as 'UIKit.UINavigationController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
