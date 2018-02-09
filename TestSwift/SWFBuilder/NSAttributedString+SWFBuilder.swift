//
//  NSAttributedString+SWFBuilder.swift
//  TestSwift
//
//  Created by wsy on 2018/1/10.
//  Copyright © 2018年 wangshengyuan. All rights reserved.
//

import Foundation
import UIKit

func AttributedString() -> NSAttributedString {
    return NSAttributedString()
}

func AttributedString(_ string: String) -> NSAttributedString {
    return NSAttributedString(string: string)
}

func AttributedString(_ astring: NSAttributedString) -> NSAttributedString {
    return NSAttributedString(attributedString: astring)
}

extension NSAttributedString
{
    
    func attributedStringToMutableAttributeString() -> NSMutableAttributedString {
        return NSMutableAttributedString(attributedString: self)
    }
    
}

