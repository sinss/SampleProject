//
//  ViewController.h
//  SampleProject
//
//  Created by Leo on 3/4/15.
//  Copyright (c) 2015 Perfectidea Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

