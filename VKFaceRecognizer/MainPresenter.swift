//
//  MainPresenter.swift
//  VKFaceRecognizer
//
//  Created by Kazakevich, Vitaly on 9/27/18.
//  Copyright © 2018 Kazakevich, Vitaly. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol MainPresenterProtocol {
    var selectedImage: Variable<UIImage> { get set }
}

class MainPresenter: MainPresenterProtocol {
    var selectedImage: Variable<UIImage>

    init() {
        guard let placeholder = UIImage(named: "imagePlaceholder") else {
            fatalError("Add placeholder first!")
        }

        selectedImage = Variable(placeholder)
    }
}
