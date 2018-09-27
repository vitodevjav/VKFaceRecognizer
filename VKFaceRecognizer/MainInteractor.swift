//
//  MainInteractor.swift
//  VKFaceRecognizer
//
//  Created by Kazakevich, Vitaly on 9/27/18.
//  Copyright © 2018 Kazakevich, Vitaly. All rights reserved.
//

import UIKit

protocol MainInteractorProtocol {
    func handleImages(with info: [UIImagePickerController.InfoKey : Any])
    func detectFace()
}

class MainInteractor: MainInteractorProtocol {
    func handleImages(with info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        
    }

    func detectFace() {

    }
}
