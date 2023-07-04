//
//  MainCoordinator.swift
//  PokeApi-CoordinatorWithRouter
//
//  Created by Kassandra Zuniga on 7/4/23.
//

import Foundation

import UIKit

final class MainCoordinator<R: MainRouter> {
    final let router: R
    
    private lazy var mainController: UIViewController = {
        let mainViewController = MainListViewController()
        return mainViewController
    }()
    
    init(router: R) {
        self.router = router
    }
}

extension MainCoordinator: Coordinator {
    func start() {
        router.navigationController.pushViewController(mainController, animated: true)
    }
}
