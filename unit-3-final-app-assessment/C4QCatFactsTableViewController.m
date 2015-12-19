//
//  C4QCatsTableViewController.m
//  unit-3-final-assessment
//
//  Created by Michael Kavouras on 12/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QCatFactsTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "C4QCatFactsFetchingModel.h"
#import "C4QCatFactsTableViewCell.h"
#import "C4QCatFactsDetailViewController.h"

#define CAT_API_URL @"http://catfacts-api.appspot.com/api/facts?number=100"

@interface C4QCatFactsTableViewController () <CatFactsCellDelegate>

@property (nonatomic) C4QCatFactsFetchingModel *fetchManager;
@property (nonatomic) NSArray *catFacts;
@property (nonatomic) NSMutableArray *indicesForSavedFacts;
@property (nonatomic) NSMutableArray *savedFacts;

@end

@implementation C4QCatFactsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupTableViewDefaults];

    self.fetchManager = [C4QCatFactsFetchingModel new];
    
    self.catFacts = [NSArray new];

    [self fetchCatFacts];

    [self getAllSavedData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [self getAllSavedData];
    [self.tableView reloadData];

}

- (void)fetchCatFacts{

    [self.fetchManager fetchCatFactsWithCompletionBlock:^(NSArray *catFactsArray) {
        self.catFacts = catFactsArray;
        [self.tableView reloadData];
    }];

}

- (void)getAllSavedData{

    NSArray *indices = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedIndices"];
    self.indicesForSavedFacts = [NSMutableArray arrayWithArray:indices];

    NSArray *savedCatFacts = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedCatFacts"];
    self.savedFacts = savedCatFacts != nil ? [NSMutableArray arrayWithArray:savedCatFacts] : [NSMutableArray new];

}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.catFacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    C4QCatFactsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CatFactsCell" forIndexPath:indexPath];

    cell.accessoryType = UITableViewCellAccessoryNone;

    cell.delegate = self;

    cell.plusButton.hidden = NO;

    cell.index = indexPath.row;

    cell.catFactsLabel.text = nil;

    NSString *fact = self.catFacts[indexPath.row];

    cell.catFactsLabel.text = fact;

    if ([self.savedFacts containsObject:self.catFacts[indexPath.row]])
    {
        cell.plusButton.hidden = YES;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    C4QCatFactsDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FactsDetailViewController"];
    detailViewController.catFact = (NSString *)self.catFacts[indexPath.row];

    [self.navigationController pushViewController:detailViewController animated:YES];
    
}


- (void)setupTableViewDefaults{

    [self.tableView registerNib:[UINib nibWithNibName:@"C4QCatFactsTableViewCell" bundle:nil] forCellReuseIdentifier:@"CatFactsCell"];

    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 160.0;
    self.tableView.allowsSelection = YES;

}

#pragma Mark - CatFactsCellDelegate Method
- (void)didTapCellPlusButtonAtIndex:(NSInteger)index
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [self.savedFacts addObject:self.catFacts[index]];

    [defaults removeObjectForKey:@"savedCatFacts"];
    [defaults setObject:self.savedFacts forKey:@"savedCatFacts"];

    [self.indicesForSavedFacts addObject:[NSNumber numberWithInteger:index]];
    [self.tableView reloadData];
    [self launchSavedFactAlert];
    
}

- (void)launchSavedFactAlert{

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Saved New Fact" message:@"Facts has been saved!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    [alert addAction:okAction];

    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"savedIndices"];
    [defaults setObject:self.indicesForSavedFacts forKey:@"savedIndices"];
    [defaults synchronize];

}



@end
