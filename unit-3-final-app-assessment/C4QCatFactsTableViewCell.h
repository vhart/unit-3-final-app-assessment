//
//  C4QCatFactsTableViewCell.h
//  unit-3-final-app-assessment
//
//  Created by Varindra Hart on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CatFactsCellDelegate <NSObject>

-(void)didTapCellPlusButtonAtIndex:(NSInteger)index;

@end

@interface C4QCatFactsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *catFactsLabel;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;

@property (nonatomic) NSInteger index;

@property (nonatomic, weak) id <CatFactsCellDelegate> delegate;

@end
