//
//  NativeService.swift
//  rn-hybrid-ios
//
//  Created by Tomoyuki Ito on 2018/04/27.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import Foundation
import UIKit

enum NativeRequestAction: String {
    
    case closeModal
    
}

@objc class NativeService: NSObject {

    @objc static func handleRequst(actionString: String?, payload: [String: Any]?) {
        guard
            let rawValue = actionString,
            let action = NativeRequestAction(rawValue: rawValue)
            else {
                print("native request action not found.")
                return
        }
        
        DispatchQueue.main.async {
            performAction(action: action)
        }
    }
    
    private static func performAction(action: NativeRequestAction) {
        switch action {
        case .closeModal:
            topViewController()?.dismiss(animated: true, completion: nil)
        }
    }
    
    private static func topViewController() -> UIViewController? {
        guard let rootvc = UIApplication.shared.delegate?.window??.rootViewController else { return nil }
        var topvc: UIViewController? = rootvc
        while true {
            if let vc = topvc?.presentedViewController {
                topvc = vc
            } else {
                break
            }
        }
        return topvc
    }
    
}
