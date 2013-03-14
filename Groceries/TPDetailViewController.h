//
//  TPDetailViewController.h
//  Groceries
//
//  Created by Bart Jacobs on 14/03/13.
//  Copyright (c) 2013 Tech Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPDetailViewController : UITableViewController

@property (strong, nonatomic) NSDictionary *item;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *onSaleLabel;
@property (weak, nonatomic) IBOutlet UILabel *perishableLabel;

@end
