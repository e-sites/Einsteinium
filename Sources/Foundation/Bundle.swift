//
//  Bundle.swift
//  Einsteinium
//
//  Created by Bas van Kuijck on 17/07/2018.
//  Copyright © 2018 E-sites. All rights reserved.
//

import Foundation

extension Bundle {
    public func isUnitTesting() -> Bool {
        let env = ProcessInfo.processInfo.environment
        return env["XCInjectBundle"] != nil
            || env["XCInjectBundleInto"] != nil
            || env["XCTestConfigurationFilePath"] != nil
    }
}
