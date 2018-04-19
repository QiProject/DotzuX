//
//  RGDebugInfoManager.swift
//  Example_Objc
//
//  Created by YJHou on 2018/4/18.
//  Copyright © 2018年 liman. All rights reserved.
//

import UIKit

public typealias ChangeAccountClosure = ( _ index:NSNumber, _ account:String, _ pwd:String) -> Void
public typealias ChangeAccountCloseClosure = () -> Void
public typealias ChangeAccountActionClosure = (_ index:NSNumber) -> Void

@objc public class RGDebugInfoManager: NSObject {

    @objc public var changeAccountClosure: ChangeAccountClosure?
    @objc public var dismissClosure: ChangeAccountCloseClosure?
    
    /// 账号切换的action action 值不同，响应不同的事件，1=新登陆
    @objc public var changeAccountActionClosure: ChangeAccountActionClosure?
    
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
