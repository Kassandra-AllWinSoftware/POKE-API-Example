//
//  App.swift
//  PokeApi-CoordinatorWithRouter
//
//  Created by Kassandra Zuniga on 7/4/23.
//

import UIKit

final class App {
    var navigationController = UINavigationController()
}

extension App: MainRouter {
    func process(route: MainTransition) {
        let coordinator = route.coordinateFor(router: self)
        coordinator.start()
    }
    
    func exit() {
        navigationController.popToRootViewController(animated: true)
    }
}

extension App: Coordinator {
    func start() {
        process(route: .showMainView)
    }
}
