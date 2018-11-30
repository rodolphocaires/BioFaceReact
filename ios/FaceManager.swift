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
class FaceManager: RCTEventEmitter, FaceViewControllerDelegate {
  func onFaceResult(_ faceResult: FaceResult) {
    let result : [String:Any] = [
      "photoFrame": faceResult.photoFrame,
      "thumb": faceResult.thumb,
      "version": faceResult.version,
      "resultCode": faceResult.resultCode,
    ]
    sendEvent(withName: "onFaceResult", body: result)
  }
  
  override func supportedEvents() -> [String] {
    return ["onFaceResult"]
  }
  
  override public static func requiresMainQueueSetup() -> Bool {
    return true;
  }
  
  @objc(capture)
  func capture() -> Void {

    let storyBoard: UIStoryboard = UIStoryboard(name: "LivenessStoryboard", bundle: Bundle(for: FaceViewController.self))

    let naviViewController = storyBoard.instantiateViewController(withIdentifier: "navigationVC") as! UINavigationController
    let livenessViewController = storyBoard.instantiateViewController(withIdentifier: "livenessVC") as! FaceViewController

    livenessViewController.delegate = self
    
    let rootViewController = UIApplication.shared.keyWindow?.rootViewController;
    
    naviViewController.pushViewController(livenessViewController, animated: false)
    
    DispatchQueue.main.async {
      rootViewController?.present(naviViewController, animated: true, completion: nil)
    }
  }
}
