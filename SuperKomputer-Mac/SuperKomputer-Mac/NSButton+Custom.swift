//
//  NSButton+Custom.swift
//  SuperKomputer-Mac
//
//  Created by Damodar Shenoy on 3/28/18.
//  Copyright © 2018 SuperKomputer. All rights reserved.
//

import Cocoa

extension NSButton {
    func setWhiteTitle(_ title: String) {
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        let font: NSFont = NSFont.systemFont(ofSize: 18)
        self.attributedTitle = NSAttributedString(string: title,
                                                  attributes: [NSAttributedStringKey.foregroundColor : NSColor.white,
                                                               NSAttributedStringKey.font : font,
                                                               NSAttributedStringKey.paragraphStyle: style])
    }
}
