//
//  TPGroceriesViewController.m
//  Groceries
//
//  Created by Bart Jacobs on 13/03/13.
//  Copyright (c) 2013 Tech Pro. All rights reserved.
//

#import "TPGroceriesViewController.h"

#import "TPDetailViewController.h"

@interface TPGroceriesViewController ()

@property (strong, nonatomic) NSArray *groceries;

@end

@implementation TPGroceriesViewController

static NSString *GroceriesCell = @"GroceriesCell";

#pragma mark -
#pragma mark View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Load Groceries
    self.groceries = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"Groceries" withExtension:@"plist"]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"DetailSegue"]) {
        // Fetch Item
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *item = [self.groceries objectAtIndex:[indexPath row]];
        
        // Configure Detail View Controller
        TPDetailViewController *vc = [segue destinationViewController];
        [vc setItem:item];
    }
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groceries ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.groceries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:GroceriesCell];
    
    // Fetch Item
    NSDictionary *item = [self.groceries objectAtIndex:[indexPath row]];
    
    // Configure Cell
    [cell.textLabel setText:item[@"name"]];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@", item[@"price"]]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

@end
