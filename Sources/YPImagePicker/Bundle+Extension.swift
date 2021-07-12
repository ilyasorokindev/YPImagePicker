//
//  Bundle+Extension.swift
//  
//
//  Created by Ilya Sorokin on 12.07.2021.
//

import Foundation

private class BundleFinder {}
 
 
public extension Bundle {
    
    static var resourceBundle: Bundle = {
 
        let bundleName = "Resources_Resources"
        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: BundleFinder.self).resourceURL,
            Bundle.main.bundleURL,
            Bundle(for: BundleFinder.self).resourceURL?.deletingLastPathComponent().deletingLastPathComponent(),
        ]
        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named \(bundleName)")
    }()
    
}
