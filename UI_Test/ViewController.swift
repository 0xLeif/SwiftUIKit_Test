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
                .corner(radius: 8)
                .layer { layer in
                    layer.borderWidth = 3
                    layer.borderColor = UIColor.systemBlue.cgColor
                    
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
                View(withPadding: 8) { self.headerView }
                    .background(color: .lightGray)
                    .corner(radius: 16),
                Spacer(height: 4),
                HStack {
                    [
                        Label("Body")
                            .text(alignment: .center)
                            .text(color: .purple),
                        Spacer(),
                        Label.caption1("Details")
                    ]
                    
                },
                Spacer(),
                
                Button("Show", titleColor: .magenta) {
                    print("Navigate")
                    
                    Navigate.shared.go(UIViewController {
                        VStack(distribution: .fillEqually) {
                            [
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
                        Label(AttributedString(string: "Hello World", attributes: StringAttributes {
                            [
                                .font: UIFont.boldSystemFont(ofSize: 16)
                            ]
                        }))
                    }
                    
                }, style: .push, titleColor: .blue),
                
                
                Spacer(),
                
                Table(defaultCellHeight: 45) {
                    [
                        Label("Cell one")
                            .configure { $0.backgroundColor = .lightGray }
                            .hideIfBlank(),
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
                        },
                        NavButton("Messages", destination: MessagesViewController(), style: .push),
                        //                        NavButton("Metal", destination: MetalViewController(), style: .push)
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
            .set(title: "Hello SwiftUIKit")
            .setRight(barButton: BarButton {
                Button({
                    print("Tapped the barbutton")
                }) {
                    Label("Button 0")
                }
            })
        
        
        view.embed {
            SafeAreaView {
                Table(defaultCellHeight: 60) {
                    [
                        Button("Say Hello") {
                            print("Hello World!")
                        },
                        
                        HStack(withSpacing: 8) {
                            [
                                Label("Name"),
                                
                                Divider(.vertical),
                                
                                Spacer(),
                                
                                Field(value: "SwiftUIKit",
                                      placeholder: "Some Name",
                                      keyboardType: .default)
                                    .inputHandler { print("New Name: \($0)") }
                            ]
                        },
                        
                        Label.callout("This is some callout text!"),
                        
                        ZStack {
                            [
                                Image(.blue)
                                    .frame(height: 60, width: 60)
                                    .offset(x: 100)
                            ]
                        },
                        
                        NavButton(destination: UIViewController {
                            View(backgroundColor: .white) {
                                LoadingImage(URL(string: "https://cdn11.bigcommerce.com/s-oe2q4reh/images/stencil/2048x2048/products/832/1401/Beige_Pekingese_Puppy__21677.1568609759.jpg")!)
                                    .contentMode(.scaleAspectFit)
                            }
                        }, style: .push) {
                            Label("Go see a puppy")
                        },
                        
                        Button("Show an Alert") {
                            Navigate.shared.alert(title: "Hello this is an Alert!",
                                                  message: "Just a test...",
                                                  secondsToPersist: 3)
                        },
                        
                        Button("Show an Alert w/ cancel") {
                            Navigate.shared.alert(title: "Hello World",
                                                  message: "This is an alert",
                                                  withActions: [.cancel],
                                                  secondsToPersist: 3)
                        },
                        
                        Button("Show a Toast Message") {
                            Navigate.shared.toast(style: .error, pinToTop: true, secondsToPersist: 4) {
                                Label("This is a test error message!")
                            }
                        }
                    ]
                }
            }
        }
    }
}

import AVKit
import Photos
import MediaPlayer

enum Permission: String {
    case camera = "NSCameraUsageDescription"
    case photos = "NSPhotoLibraryUsageDescription"
    // TODO: Left
    case addPhotos = "NSPhotoLibraryAddUsageDescription"
    case locationAlways = "NSLocationAlwaysUsageDescription"
    case locationWhenInUse = "NSLocationWhenInUseUsageDescription"
    case contacts = "NSContactsUsageDescription"
    case calendar = "NSCalendarsUsageDescription"
    case reminders = "NSRemindersUsageDescription"
    case healthShare = "NSHealthShareUsageDescription"
    case healthUpdate = "NSHealthUpdateUsageDescription"
    case nfcReader = "NFCReaderUsageDescription"
    case bluetooth = "NSBluetoothPeripheralUsageDescription"
    case microphone = "NSMicrophoneUsageDescription"
    case siri = "NSSiriUsageDescription"
    case speechRecognition = "NSSpeechRecognitionUsageDescription"
    case motion = "NSMotionUsageDescription"
    case appleMusic = "NSAppleMusicUsageDescription"
    case faceID = "NSFaceIDUsageDescription"
    
    func request(completionHandler: @escaping (Bool) -> Void = { _ in }) {
        guard let _ = Bundle.main.object(forInfoDictionaryKey: rawValue) else {
            Navigate.shared.toast(style: .error) {
                Label("Missing: \(self.rawValue) from Info.plist")
                    .number(ofLines: 3)
            }
            return
        }
        
        switch self {
        case .camera:
            requestCamera(completionHandler: completionHandler)
        case .photos:
            requestPhotos(completionHandler: completionHandler)
        default:
            print("TODO: \(rawValue)")
        }
    }
    
    // Camera
    func requestCamera(completionHandler: @escaping (Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: completionHandler)
    }
    
    // Photos
    func requestPhotos(completionHandler: @escaping (Bool) -> Void) {
        if PHPhotoLibrary.authorizationStatus() == .notDetermined {
            PHPhotoLibrary.requestAuthorization { (status) in
                completionHandler(status == .authorized)
            }
        }
    }
    
    func requestLibrary(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestLocationAlways(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestLocationWhenInUse(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestContacts(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestCalendar(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestReminders(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestHealthShare(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestHealthUpdate(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestNFCReader(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestBluetooth(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestMicrophone(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestSiri(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestSpeechRecognition(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestMotion(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestAppleMusic(completionHandler: @escaping (Bool) -> Void) {
        
    }
    func requestFaceID(completionHandler: @escaping (Bool) -> Void) {
        
    }
}
