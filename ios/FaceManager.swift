//
//  FaceManager.swift
//  BioFaceReact
//
//  Created by Mobile Developer on 29/11/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

import Foundation
import face

@objc(FaceManager)
class FaceManager: UIViewController, FaceViewControllerDelegate {
  
  func onFaceResult(_ faceResult: FaceResult) {
    
    // Result to callback
    
    print("RESULTS")
    
    for element in faceResult.photoFrame {
      print("ELEMENTO: \(element)")
    }
    
    print("result version \(faceResult.version)")
    print("result Code: \(faceResult.resultCode)")
    print("result thumb: \(faceResult.thumb)")
  }
  
  @objc(capture)
  func capture() -> Void {

    let storyBoard: UIStoryboard = UIStoryboard(name: "LivenessStoryboard", bundle: Bundle(for: FaceViewController.self))

    let naviViewController = storyBoard.instantiateViewController(withIdentifier: "navigationVC") as! UINavigationController
    let livenessViewController = storyBoard.instantiateViewController(withIdentifier: "livenessVC") as! FaceViewController

    livenessViewController.delegate = self

    self.present(naviViewController, animated: false, completion: nil)

    naviViewController.pushViewController(livenessViewController, animated: false)
  }
}
