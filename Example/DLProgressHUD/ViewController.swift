//
//  ViewController.swift
//  DLProgressHUD
//
//  Created by DeluxeAlonso on 11/24/2021.
//  Copyright (c) 2021 DeluxeAlonso. All rights reserved.
//

import UIKit
import DLProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DLProgressHUD.defaultConfiguration.backgroundInteractionEnabled = true
    }

    @IBAction func showHUDAction(_ sender: Any) {
        DLProgressHUD.show(.loading)
    }

    @IBAction func showHUDWithTextAction(_ sender: Any) {
        DLProgressHUD.show(.loadingWithText("Loading..."))
    }

    @IBAction func showHUDWithTextOnlyAction(_ sender: Any) {
        DLProgressHUD.show(.textOnly("Loading..."))
    }

    @IBAction func showHUDWithImageAction(_ sender: Any) {
        DLProgressHUD.show(.image(UIImage(named: "Check")!))
    }

}
