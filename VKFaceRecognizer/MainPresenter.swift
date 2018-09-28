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
    var state: Variable<DetectionState> { get set }

}

class MainPresenter: MainPresenterProtocol {
    var selectedImage: Variable<UIImage>
    var state: Variable<DetectionState>

    init() {
        guard let placeholder = UIImage(named: "imagePlaceholder") else {
            fatalError("Add placeholder first!")
        }

        selectedImage = Variable(placeholder)
        state = Variable(.ready)
    }
}

enum DetectionState {
    case ready, loading, failed(error: Error), detecting, detectionFinished(faceCount: Int)

    var description: String {
        return "Description" // implement description
    }
}

enum DetectionError: Error {
    case imageNotSelected, convertionError, unexpectedResultFormat

    var localizedDescription: String {
        switch self {
        case .imageNotSelected: return "Error when selecting image."
        case .convertionError: return "Error when converting image."
        case .unexpectedResultFormat: return "Error when detexcting faces."
        }
    }
}
