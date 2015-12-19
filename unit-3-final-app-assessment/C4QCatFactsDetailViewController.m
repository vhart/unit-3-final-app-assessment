//
//  C4QCatFactDetailViewController.m
//  unit-3-final-app-assessment
//
//  Created by Michael Kavouras on 12/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsDetailViewController.h"
#import "C4QGiphyCatPictureFetch.h"

#define CAT_GIF_URL @"http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC"

@interface C4QCatFactsDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *giphyImageView;
@property (weak, nonatomic) IBOutlet UILabel *catFactLabel;
@property (nonatomic) C4QGiphyCatPictureFetch *catPictureFetcher;
@property (nonatomic) NSURLSessionDataTask *currentTask;

@end

@implementation C4QCatFactsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.catFactLabel.text = self.catFact;
    [self fetchCatPicture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchCatPicture{

    self.catPictureFetcher = [C4QGiphyCatPictureFetch new];

    NSURLSessionDataTask *task = [self.catPictureFetcher fetchGiphyCatImageWithCompletion:^(UIImage *catImage) {
        self.giphyImageView.image = catImage;
    }];

    self.currentTask = task;

}

- (void)viewWillDisappear:(BOOL)animated{

    if (self.currentTask.state != NSURLSessionTaskStateCompleted) {
        [self.currentTask cancel];
    }
    else if (!self.giphyImageView.image) {
        self.catPictureFetcher.cancelled = YES;
    }

}

@end
