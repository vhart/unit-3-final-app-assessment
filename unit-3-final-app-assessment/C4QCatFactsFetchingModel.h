//
//  C4QCatFactsFetchingModel.h
//  unit-3-final-app-assessment
//
//  Created by Varindra Hart on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface C4QCatFactsFetchingModel : NSObject

- (void)fetchCatFactsWithCompletionBlock:(void (^)(NSArray *catFactsArray))onCompletion;

@end
