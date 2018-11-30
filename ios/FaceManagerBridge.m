//
//  FaceManagerBridge.m
//  BioFaceReact
//
//  Created by Mobile Developer on 29/11/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(FaceManager, RCTEventEmitter)

RCT_EXTERN_METHOD(capture)

@end
