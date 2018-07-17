//
//  UIDevice.swift
//  Extensium
//
//  Created by Bas van Kuijck on 19-11-15.
//  Copyright © 2015 e-sites.nl All rights reserved.
//

import Foundation
import UIKit
import AudioToolbox

extension UIDevice {
    public var isJailBroken: Bool {
        #if arch(i386) || arch(x86_64)
            return false
		#else
			return FileManager.default.fileExists(atPath: "/private/var/lib/apt")
        #endif
    }
    
    public func vibrate() {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    public func lowPowerModeEnabled() -> Bool {
        if #available(iOS 9.0, *) {
            return ProcessInfo.processInfo.isLowPowerModeEnabled
        } else {
            return false
        }
    }
}
