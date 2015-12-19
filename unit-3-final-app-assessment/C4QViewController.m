//
//  ViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 11/30/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QViewController.h"
#import "C4QColorPickerViewController.h"

@interface C4QViewController () <ColorPickerDelegate>

@end

@implementation C4QViewController

#pragma MARK - ColorPickerDelegate Methods

- (void)didPickColor:(UIColor *)color{

    self.view.backgroundColor = color;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    C4QColorPickerViewController *nextViewController = [segue.destinationViewController isKindOfClass:[C4QColorPickerViewController class]] ? segue.destinationViewController : nil;
    if (nextViewController) {
        nextViewController.delegate = self;
    }

}

@end
