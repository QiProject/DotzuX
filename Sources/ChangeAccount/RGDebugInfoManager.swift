//
//  RGDebugInfoManager.swift
//  Example_Objc
//
//  Created by YJHou on 2018/4/18.
//  Copyright © 2018年 liman. All rights reserved.
//

import UIKit

public typealias ChangeAccountClosure = (_ account:String, _ pwd:String, _ index:NSNumber) -> Void
public typealias ChangeAccountSuccessClosure = () -> Void

@objc public class RGDebugInfoManager: NSObject {

    @objc public var changeAccountClosure: ChangeAccountClosure?
    @objc public var changeAccountSuccessClosure: ChangeAccountSuccessClosure?
    
    @objc public static let shared = RGDebugInfoManager()
    
    //MARK: - objcLog() usage only for Objective-C
    @objc public static func objcLog(_ file: String = #file,
                                     _ function: String = #function,
                                     _ line: Int = #line,
                                     _ message: Any,
                                     _ color: UIColor? = nil) {
        LogHelper.shared.handleLog(file: file, function: function, line: line, message: message, color: color)
    }
}
