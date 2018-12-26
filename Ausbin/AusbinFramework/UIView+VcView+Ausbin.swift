//
//  NSObject+AusbinVcService.swift
//  Ausbin
//
//  Created by bin on 2018/12/24.
//  Copyright © 2018年 BinHuang. All rights reserved.
//

import UIKit

private var actionsKey: Void?
//private var viewChangeKey: Void?

/**
 ViewController的View的扩展方法
 */
extension UIView {
    
    private var asb_actions : [String]? {
        get {
            return objc_getAssociatedObject(self, &actionsKey) as? [String];
        }
        set(newValue) {
            objc_setAssociatedObject(self, &actionsKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    };
    
    static func asb_vc_view_generateAction() -> String{
        let now = Date()
        let timeInterval: TimeInterval = now.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        let random = getRandomStringOfLength(length: 10);
        return "Action@\(millisecond)@\(random)";
    }
    
    func asb_vc_view_isActionAvailble(_ action: String, _ targetAction: String) -> Bool{
        if(self.asb_actions == nil){
            self.asb_actions = (self as! AusbinVcViewDelegate).asb_getAvailableActions();
            for item in self.asb_actions!{
                print("actions=\(item)");
            }
        }
        if(action == targetAction && (self.asb_actions?.contains(action))!){
            return true;
        }
        return false;
    }
    
    /**
     生成随机字符串,
     
     - parameter length: 生成的字符串的长度
     
     - returns: 随机生成的字符串
     */
    private static func getRandomStringOfLength(length: Int) -> String {
        let characters : String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        var ranStr = ""
        for _ in 0..<length {
            let index = Int(arc4random_uniform(UInt32(characters.count)));
            let char = (characters as NSString).substring(with: NSRange.init(location: index, length: 1));
            ranStr.append(char);
        }
        return ranStr
        
    }
    
//    var asb_viewChangeDelegate : AusbinVcViewChangeDelegate? {
//        get {
//            return objc_getAssociatedObject(self, &viewChangeKey) as? AusbinVcViewChangeDelegate;
//        }
//        set(newValue) {
//            objc_setAssociatedObject(self, &viewChangeKey, newValue, .OBJC_ASSOCIATION_ASSIGN);
//        }
//    };
    
    //MARK: - 自定义方法
//    func asb_isAvailable(action: String) -> Bool {
//        if(self.asb_actions != nil){
//            return self.asb_actions!.contains(action);
//        }
//        return false;
//    }
//
//    func asb_setAction(_ initActions: [String]) {
//        self.asb_actions = initActions;
//    }
    
    

}