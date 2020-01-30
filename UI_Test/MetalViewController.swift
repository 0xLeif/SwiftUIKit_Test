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

//class MetalViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        Navigate.shared.configure(controller: navigationController)
//        
//        view.embed {
//           ScrollView {
//               VStack(distribution: .fillEqually) {
//                   [
//                       MetalView(renderer: TriangleRenderer()),
//                       MetalView(renderer: MeshRenderer()),
//                       MetalView(renderer: CustomRenderer()
//                           .clear { .init(red: 0, green: 1, blue: 0.5, alpha: 1) }
//                           .vertex { "vertex_main_moving" }
//                           .fragment { "fragment_main_test" }
//                       ),
//                       MetalView(renderer: CustomRenderer()
//                           .compute { "compute" }
//                       )
//                   ]
//               }
//               .frame(height: 1000, width: Float(self.view.bounds.width))
//           }
//        }
//                
//    }
//    
//}
