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
            ScrollView {
                VStack(distribution: .fillEqually) {
                    [
                        Label.title1("Hello World"),
                        Label.title2("Hello World"),
                        Label.title3("Hello World"),
                        Label.headline("Hello World"),
                        Label.subheadline("Hello Worldf"),
                        Label.body("Hello World"),
                        Label.callout("Hello World"),
                        Label.caption1("Hello World"),
                        Label.caption2("Hello World"),
                        Slider(value: 0.5, from: 0, to: 1) { value in
                            print("Value: \(value)")
                        }
                        
                    ]
                }
                .frame(height: 1000)
                .padding(16)
                    
                .debug()
            }
        }
        .configure {
            $0.backgroundColor = .white
        }
        
        print("Test")
    }
}
