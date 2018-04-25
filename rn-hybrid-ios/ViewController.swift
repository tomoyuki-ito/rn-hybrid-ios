//
//  ViewController.swift
//  rn-hybrid-ios
//
//  Created by Tomoyuki Ito on 2018/04/24.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import UIKit
import React

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func profileTapped(sender : UIButton) {
        let vc = createReactViewController(moduleName: "Profile", message: "This is Profile Screen!")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func accountTapped(sender : UIButton) {
        let vc = createReactViewController(moduleName: "Account", message: "")
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func otherTapped(sender : UIButton) {
        let vc = createReactViewController(moduleName: "Other", message: "")
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }

    private func createReactViewController(moduleName: String, message: String) -> UIViewController {
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
        let props: [AnyHashable: Any] = ["message": message]
        
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: moduleName,
            initialProperties: props,
            launchOptions: nil
        )
        let vc = UIViewController()
        vc.view = rootView
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(close))
        let navi = UINavigationController(rootViewController: vc)
        return navi
    }
    
}

