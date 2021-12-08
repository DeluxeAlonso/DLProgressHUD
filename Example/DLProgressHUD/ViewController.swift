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

    @IBAction func showHUDAction(_ sender: Any) {
        DLProgressHUD.show(.loadingWithText("Loading...")) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                DLProgressHUD.dismiss(with: 0.25)
            }
        }
    }

}
