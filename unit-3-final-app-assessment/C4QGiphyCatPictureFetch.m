//
//  C4QGiphyCatPictureFetch.m
//  unit-3-final-app-assessment
//
//  Created by Varindra Hart on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QGiphyCatPictureFetch.h"
#import <AFNetworking/AFNetworking.h>

@implementation C4QGiphyCatPictureFetch

- (NSURLSessionDataTask *)fetchGiphyCatImageWithCompletion:(void (^)(UIImage *catImage))onCompletion{


    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSURLSessionDataTask *task = [manager GET:@"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        NSArray *data = responseObject[@"data"];
        NSDictionary *randomDictionary = data[arc4random_uniform((int)data.count)];
        NSString *stringUrl = randomDictionary[@"images"][@"fixed_width_downsampled"][@"url"];

        [self downloadImageAsync:stringUrl handler:onCompletion];

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        NSLog(@"%@", error.userInfo);

    }];

    return task;
}

- (void)downloadImageAsync:(NSString *)urlString handler:(void (^)(UIImage *catImage))onCompletion{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{

        while (!self.cancelled) {

            UIImage *catImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]]];

            dispatch_sync(dispatch_get_main_queue(), ^{
                onCompletion(catImage);
            });

            break;
        }
        NSLog(@"cancelled");
    });
}
@end
