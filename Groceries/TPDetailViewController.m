//
//  TPDetailViewController.m
//  Groceries
//
//  Created by Bart Jacobs on 14/03/13.
//  Copyright (c) 2013 Tech Pro. All rights reserved.
//

#import "TPDetailViewController.h"

@interface TPDetailViewController ()

@end

@implementation TPDetailViewController

#pragma mark -
#pragma mark View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Update Labels
    if (self.item) {
        // Name Label
        [self.nameLabel setText:self.item[@"name"]];
        
        // Price Label
        NSNumber *price = self.item[@"price"];
        [self.priceLabel setText:[NSString stringWithFormat:@"$ %@", price]];
        
        // On Sale Label
        BOOL onSale = [self.item[@"onSale"] boolValue];
        [self.onSaleLabel setText:(onSale ? @"YES" : @"NO")];
        
        // Perishable Label
        BOOL perishable = [self.item[@"perishable"] boolValue];
        [self.perishableLabel setText:(perishable ? @"YES" : @"NO")];
    }
}

@end
