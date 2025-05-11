//
//  SpotifyCloseApp.swift
//  SpotifyClose
//
//  Created by Abdul Manum on 27/06/2024.
//

import SwiftUI
import SwiftfulRouting

@main
struct SpotifyCloseApp: App {
    var body: some Scene {
        WindowGroup {
                RouterView{ _ in
                    ContentView()
                }
        }
    }
}


// code for navigating back
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
 
