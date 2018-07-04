//
//  TLMAngle.h
//  MyoKit
//
//  Copyright (C) 2014 Thalmic Labs Inc.
//  Distributed under the Myo SDK license agreement. See LICENSE.txt.
//

#import <Foundation/Foundation.h>

/** A representation of an angle in either degrees and radians */
@interface TLMAngle : NSObject <NSCopying>

/** The angle represented in degrees */
@property (nonatomic, readonly) double degrees;

/** The angle represented in radians */
@property (nonatomic, readonly) double radians;

- (instancetype)init __attribute__((unavailable("init not available, use either initWithRadians or initWithDegrees")));

- (instancetype)initWithRadians:(double)aRadian;


- (instancetype)initWithDegrees:(double)aDegree;

- (instancetype)initWithAngle:(TLMAngle *)anAngle;

@end
