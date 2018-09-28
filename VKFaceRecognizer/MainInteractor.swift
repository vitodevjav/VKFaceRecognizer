//
//  MainInteractor.swift
//  VKFaceRecognizer
//
//  Created by Kazakevich, Vitaly on 9/27/18.
//  Copyright © 2018 Kazakevich, Vitaly. All rights reserved.
//

import UIKit
import Vision
import CoreGraphics

protocol MainInteractorProtocol {
    func handleImages(with info: [UIImagePickerController.InfoKey : Any])
    func detectFace()
}

class MainInteractor: MainInteractorProtocol {
    var presenter: MainPresenterProtocol?
    func handleImages(with info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        presenter?.selectedImage.value = image
    }

    func detectFace() {
        guard let cgImage = presenter?.selectedImage.value.cgImage else { return } // update error state

        let request = VNDetectFaceLandmarksRequest(completionHandler: didFinishScaningImage)
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        do {
            try requestHandler.perform([request])
        } catch {
            print(error) // error state
        }
    }

    private func didFinishScaningImage(request: VNRequest, error: Error?) {
        if error != nil { } // error state
        guard let results = request.results as? [VNFaceObservation] else { return } // error state
    }
}
