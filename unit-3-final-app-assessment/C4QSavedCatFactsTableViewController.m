//
//  C4QSavedCatFactsTableViewController.m
//  unit-3-final-app-assessment
//
//  Created by Varindra Hart on 12/19/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QSavedCatFactsTableViewController.h"
#import "C4QCatFactsDetailViewController.h"

@interface C4QSavedCatFactsTableViewController ()

@property (nonatomic) NSMutableArray *savedFacts;

@end

@implementation C4QSavedCatFactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getSavedCatFacts];
}

- (void)getSavedCatFacts{

    NSArray *arrayOfFacts = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedCatFacts"];
    self.savedFacts = arrayOfFacts ? [NSMutableArray arrayWithArray:arrayOfFacts] : [NSMutableArray new];
    [self.tableView reloadData];

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.savedFacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SavedFactCell" forIndexPath:indexPath];
    
    // Configure the cell...

    cell.textLabel.text = self.savedFacts[indexPath.row];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{

    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.savedFacts removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }

}

- (void)saveToDefaults{

    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"savedCatFacts"];
    [[NSUserDefaults standardUserDefaults] setObject:self.savedFacts forKey:@"savedCatFacts"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

- (void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    [self saveToDefaults];
}

@end
