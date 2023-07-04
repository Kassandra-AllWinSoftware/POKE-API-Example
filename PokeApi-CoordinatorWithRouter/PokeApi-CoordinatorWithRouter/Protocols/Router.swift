//
//  Router.swift
//  PokeApi-CoordinatorWithRouter
//
//  Created by Kassandra Zuniga on 7/4/23.
//

import UIKit

protocol Router {
    associatedtype Route
    var navigationController: UINavigationController { get set }
    func process(route: Route)
    func exit()
}

protocol MainRouter: Router where Route == MainTransition { }
