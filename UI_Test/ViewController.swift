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
        VStack(withSpacing: 16) {
            [
                VStack {
                    [
                        Label("Hello World"),
                        View(backgroundColor: .black).frame(height: 1)
                    ]
                },
                Spacer(),
                Label("Testing VStack"),
                
                Button("Hello Tap Me!", titleColor: .systemBlue, backgroundColor: .systemYellow) {
                    print("Hello You Tapped me!")
                }
                .layer {
                    $0.borderWidth = 3
                    $0.borderColor = UIColor.systemBlue.cgColor
                    $0.cornerRadius = 6
                }
                .accessibility(label: "Tap this button!"),
                
                HStack {
                    [
                        Label("Are you new?"),
                        Spacer(),
                        Switch(isOn: true) {
                            print("Toogle is \($0)")
                        }
                    ]
                }
            ]
        }
        .frame(height: 200)
        .padding(16)
    }
    
    var mainView: UIView {
        VStack {
            [
                View(backgroundColor: .lightGray) { self.headerView }
                    .padding()
                    .layer { $0.cornerRadius = 16 },
                Spacer(height: 4),
                HStack { [Label("Body"), Spacer(), Label("Details")] },
                Spacer(),
                
                Button("Show", titleColor: .magenta) {
                    print("Navigate")
                    let vc = TestViewController()
                    
                    self.show(vc, sender: nil)
                },
                
                Button("Present", titleColor: .magenta) {
                    print("Navigate")
                    let vc = TestViewController()
                    
                    self.present(vc, animated: true)
                },
                
                Spacer(),
                
                Table(defaultCellHeight: 45) {
                    [
                        Label("Cell One"),
                        Label("Cell Two"),
                        HStack {
                            [
                                Label("Title"),
                                Spacer(),
                                Label("45")
                            ]
                        }
                    ]
                }
                .didSelectHandler({ (view) in
                    print(view)
                })
                .configureCell { (cell)  in
                    cell.accessoryType = .checkmark
                }
            ]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.embed {
            SafeAreaView {
                mainView
            }
        }
    }
}

