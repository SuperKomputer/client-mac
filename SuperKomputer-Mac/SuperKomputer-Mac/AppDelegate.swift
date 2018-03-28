//
//  AppDelegate.swift
//  SuperKomputer-Mac
//
//  Created by Damodar Shenoy on 3/27/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    static var instance: AppDelegate {
        return (NSApp.delegate as! AppDelegate)
    }
    
    var currentViewController: NSViewController? {
        didSet {
            if oldValue != currentViewController, let newValue = currentViewController {
                oldValue?.view.removeFromSuperview()
                NSApp.mainWindow?.contentView = newValue.view
            }
        }
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

}

