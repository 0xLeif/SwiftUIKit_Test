//
//  TestViewController.swift
//  UI_Test
//
//  Created by Zach Eriksen on 11/2/19.
//  Copyright © 2019 ol. All rights reserved.
//

import UIKit
import SwiftUIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.embed {
            VStack {
                [
                    Label("Hello World")
                ]
            }
        }
        .configure {
            $0.backgroundColor = .white
        }
        
        print("Test")
    }
}
