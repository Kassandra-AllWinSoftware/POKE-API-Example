//
//  MainTransition.swift
//  PokeApi-CoordinatorWithRouter
//
//  Created by Kassandra Zuniga on 7/4/23.
//

import Foundation

enum MainTransition {
    case showMainView
    
    func coordinateFor<R: MainRouter>(router: R) -> Coordinator {
        switch self {
        case .showMainView: return MainCoordinator(router: router)
        }
    }
}
