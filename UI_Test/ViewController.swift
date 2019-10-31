//
//  ViewController.swift
//  UI_Test
//
//  Created by CRi on 10/30/19.
//  Copyright © 2019 ol. All rights reserved.
//

import UIKit
import SwiftUIKit

class ViewController: UIViewController {
    
    var headerView: UIView {
        VStack {
            [
                Label("Hello World"),
                Label("Testing VStack"),
                Button("Hello Tap Me!", titleColor: .systemBlue, backgroundColor: .systemYellow) {
                    print("Hello You Tapped me!")
                }.layer {
                    $0.borderWidth = 3
                    $0.borderColor = UIColor.systemBlue.cgColor
                    $0.cornerRadius = 6
                }.accessibility(label: "Tap this button!"),
                UISwitch().configure {
                    $0.isOn = true
                    $0.onTintColor = .systemPurple
                }
            ]
        }
        .frame(height: 200)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.embed {
            SafeAreaView {
                VStack {
                    [
                        View(backgroundColor: .lightGray)
                            .embed { headerView }
                            .padding()
                            .layer { $0.cornerRadius = 16 },
                        Spacer(height: 4),
                        HStack { [Label("Body"), Spacer(), Label("Details")] },
                        Spacer()
                    ]
                }
            }
        }
        
    }
}

