//
//  MessagesViewController.swift
//  UI_Test
//
//  Created by Zach Eriksen on 12/4/19.
//  Copyright © 2019 ol. All rights reserved.
//

import UIKit
import SwiftUIKit

class MessagesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.embed {
            Table {
                [
                    Button("Alert") {
                        Navigate.shared.alert(title: "Alert!",
                                              message: "Panic",
                                              withActions: [.cancel],
                                              secondsToPersist: 2)
                    },
                    Button("Toast.error") {
                        Navigate.shared.toast(style: .error) {
                            Label("""
Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.

Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini
""")
                                .number(ofLines: 3)
                                .padding(8)
                        }
                    },
                    Button("Toast.warning") {
                        Navigate.shared.toast(style: .warning) {
                            Label("""
Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.

Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini
""")
                                .padding(8)
                        }
                    },
                    Button("Toast.success") {
                        Navigate.shared.toast(style: .success, pinToTop: false) {
                            Label("""
                                Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.

                                Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini
                                """)
                                .configure { $0.numberOfLines = 10 }
                                .padding(8)
                        }
                    },
                    Button("Toast.info") {
                        Navigate.shared.toast(style: .info) {
                            Label("""
Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.

Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini
""")
                                .padding(8)
                        }
                    },
                    Button("Toast.debug") {
                        Navigate.shared.toast(style: .debug) {
                            Label("""
Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.

Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini
""")
                                .padding(8)
                        }
                    },
                    Button("Toast.custom") {
                        Navigate.shared.toast(style: .custom) {
                            Label("""
                                Veggies es bonus vobis, proinde vos postulo essum magis kohlrabi welsh onion daikon amaranth tatsoi tomatillo melon azuki bean garlic.

                                Gumbo beet greens corn soko endive gumbo gourd. Parsley shallot courgette tatsoi pea sprouts fava bean collard greens dandelion okra wakame tomato. Dandelion cucumber earthnut pea peanut soko zucchini
                                """)
                                .configure { $0.numberOfLines = 10 }
                                .padding(8)
                        }
                    },
                ]
            }
        }
    }
}
