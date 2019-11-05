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
                        Divider(.horizontal)
                    ]
                },
                Spacer(),
                Divider(.horizontal),
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
                
                HStack(withSpacing: 8) {
                    [
                        Label("Are you new?"),
                        Divider(.vertical),
                        Spacer(),
                        Switch(isOn: true) {
                            print("Toogle is \($0)")
                        }
                    ]
                }
            ]
        }
        .frame(height: 200)
    }
    
    var mainView: UIView {
        VStack {
            [
                View(backgroundColor: .lightGray) { self.headerView }
                    .padding()
                    .layer { $0.cornerRadius = 16 },
                Spacer(height: 4),
                HStack { [Label("Body"), Spacer(), Label.caption1("Details")] },
                Spacer(),
                
                Button("Show", titleColor: .magenta) {
                    print("Navigate")
                    
                    Navigate.shared.go(UIViewController {
                        VStack(distribution: .fillEqually) {
                            [
                                Image(URL(string: "https://i.imgur.com/sy9p4.jpg")!)
                                    .contentMode(.scaleAspectFit),
                                Image("dog")
                            ]
                        }
                    }, style: .push)
                },
                
                Button("Present", titleColor: .magenta) {
                    print("Navigate")
                    Navigate.shared.go(from: self, to: TestViewController(), style: .modal)
                },
                
                NavButton("Go here", destination: UIViewController {
                    View(backgroundColor: .blue) {
                        Label("Hello World")
                    }
                    
                }, style: .push, titleColor: .blue),
                
                
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
                        }.padding(),
                        Field(value: "First", placeholder: "Hello World", keyboardType: .default)
                            .willInputUpdateHandler { (field, newValue, char) -> Bool in
                                return newValue.count < 10
                        }
                        .inputHandler { (value) in
                            print("New Value!: \(value)")
                        },
                        Field(value: "4", placeholder: "Numbers Only!", keyboardType: .numberPad)
                            .willInputUpdateHandler { (field, newValue, char) -> Bool in
                                return Int(char) != nil || char == ""
                        }
                        .inputHandler { (value) in
                            print("New Value!: \(value)")
                        }
                    ]
                }
                .didSelectHandler({ (view) in
                    print(view)
                })
            ]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Navigate.shared.configure(controller: navigationController)
        
        navigationItem.titleView = Image(.blue)
            .frame(height: 32, width: 32)
        
        view.embed {
            SafeAreaView {
                mainView
            }
        }
    }
}
