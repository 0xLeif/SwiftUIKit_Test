//
//  MetalViewController.swift
//  UI_Test
//
//  Created by Zach Eriksen on 1/6/20.
//  Copyright © 2020 ol. All rights reserved.
//

import UIKit
import MetalKit
import SwiftUIKit


class MetalView: MTKView {
    private var renderer: Renderer
    
    init(renderer: Renderer) {
        self.renderer = renderer
        
        super.init(frame: .zero, device: renderer.device)
        
        self.renderer.load(metalView: self)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MetalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Navigate.shared.configure(controller: navigationController)
        
        view.embed {
            ScrollView {
            VStack(withSpacing: 5, padding: 0, alignment: .fill, distribution: .fillProportionally) {
                     [
                        Button("Triangle", titleColor: .systemBlue, backgroundColor: .systemGray) {
                            Navigate.shared.go(UIViewController {
                                View {
                                    MetalView(renderer:
                                        CustomRenderer()
                                        .vertex { "vertex_main_moving" }
                                        .fragment { "fragment_main" }
                                        .mesh { device in Primitive.makeCube(device: device, size: 1) }
                                        .clear { MTLClearColor(red: 1, green: 0, blue: 1, alpha: 1) }
                                    )
                                }
                            }, style: .push)
                        },
                        Button("Cube", titleColor: .systemBlue, backgroundColor: .systemGray) {
                            Navigate.shared.go(UIViewController {
                                View {
                                    MetalView(renderer: MeshRenderer())
                                }
                            }, style: .push)
                        },
                        Button("Triangle3", titleColor: .systemBlue, backgroundColor: .systemGray) {
                            Navigate.shared.go(UIViewController {
                                View {
                                    MetalView(renderer: ColorChangeRenderer())
                                }
                            }, style: .push)
                        }
                    ]
            }
            .frame(height: 1000, width: Float(self.view.bounds.width))
            }
        }
        
                
        
                
    }
    
}
