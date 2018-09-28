//
//  MainRouter.swift
//  VKFaceRecognizer
//
//  Created by Kazakevich, Vitaly on 9/27/18.
//  Copyright © 2018 Kazakevich, Vitaly. All rights reserved.
//

import UIKit

class MainRouter {
    func createMainModule() -> UIViewController {
        let vc = MainViewController()
        let presenter = MainPresenter()
        let interactor = MainInteractor()

        vc.presenter = presenter
        vc.interactor = interactor

        interactor.presenter = presenter

        return vc
    }
}
