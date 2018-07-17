//
//  DispatchQueue.swift
//  Einsteinium
//
//  Created by Bas van Kuijck on 15-09-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    private static var _onceTracker: [String] = []
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - parameter token: A unique reverse DNS style name such as com.vectorform.<name> or a GUID
     - parameter block: Block to execute once
     */
    public class func once(token: String, block: () -> Void) {
        sync(self) {
            if _onceTracker.contains(token) {
                return
            }

            _onceTracker.append(token)
            block()
        }
    }

    public class func sync(_ lock: Any, closure: () -> Void) {
        objc_sync_enter(lock)
        closure()
        objc_sync_exit(lock)
    }
}
