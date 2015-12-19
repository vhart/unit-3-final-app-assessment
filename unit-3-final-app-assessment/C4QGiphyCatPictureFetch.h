//
//  C4QGiphyCatPictureFetch.h
//  unit-3-final-app-assessment
//
//  Created by Varindra Hart on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface C4QGiphyCatPictureFetch : NSObject

- (NSURLSessionDataTask *)fetchGiphyCatImageWithCompletion:(void (^)(UIImage *catImage))onCompletion;

@property (nonatomic) BOOL cancelled;

@end
