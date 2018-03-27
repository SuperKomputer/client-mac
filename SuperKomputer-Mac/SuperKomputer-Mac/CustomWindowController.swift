//
//  CustomWindowController.swift
//  SuperKomputer-Mac
//
//  Created by Damodar Shenoy on 3/27/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Cocoa

class CustomWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        self.window?.backgroundColor = NSColor.white
        self.window?.titleVisibility = .hidden
        self.window?.titlebarAppearsTransparent = true

    }

}
