//
//  C4QCatFactsFetchingModel.m
//  unit-3-final-app-assessment
//
//  Created by Varindra Hart on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsFetchingModel.h"

@implementation C4QCatFactsFetchingModel

-(void)fetchCatFactsWithCompletionBlock:(void (^)(NSArray *catFactsArray))onCompletion{

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/javascript"];
    [manager GET:@"http://catfacts-api.appspot.com/api/facts?number=100" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        onCompletion(responseObject[@"facts"]);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error.userInfo);
    }];

}


@end
