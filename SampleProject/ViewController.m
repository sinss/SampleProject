//
//  ViewController.m
//  SampleProject
//
//  Created by Leo on 3/4/15.
//  Copyright (c) 2015 Perfectidea Inc. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

#import "NSStringSampleViewController.h"
#import "NSArraySampleViewController.h"
#import "NSDictionSampleViewController.h"
#import "NSNumberSampleViewController.h"

#define reuseCellIdentifier @"reuseCellIdentifier"

@interface ViewController ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *subtitles;

@end

@implementation ViewController

- (NSArray*)items
{
    if (!_items)
    {
        //舊的方式
        //_items = [NSArray arrayWithObjects:@"NSString", @"NSArray", @"NSDictionary", @"NSNumber", nil];
        //新的方式
        _items = @[@"NSString", @"NSNumber", @"NSArray", @"NSDictionary"];
    }
    return _items;
}

- (NSArray*)subtitles
{
    if (!_subtitles)
    {
        _subtitles = @[@"字串", @"一般陣列", @"一個像HashMap的東西", @"數字"];
    }
    return _subtitles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"Sample Code"];
    //1. 註冊Reuse的cell
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:reuseCellIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate, UITableviewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section + %li", section];
}

//設定每個Header的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.f;
}

//設定每個Row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.f;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellIdentifier forIndexPath:indexPath];
    
    cell.titleLabel.text = self.items[indexPath.row];
    cell.subtitleLabel.text = self.subtitles[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //如果沒這下這行指令，會一直是在選中狀態
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *selectedString = _items[indexPath.row];
    
    UIViewController *vc = nil;
    if ([selectedString isEqualToString:@"NSString"])
    {
        vc = [[NSStringSampleViewController alloc] initWithNibName:@"NSStringSampleViewController" bundle:nil];
    }
    else if ([selectedString isEqualToString:@"NSArray"])
    {
        vc = [[NSArraySampleViewController alloc] initWithNibName:@"NSArraySampleViewController" bundle:nil];
    }
    else if ([selectedString isEqualToString:@"NSDictionary"])
    {
        vc = [[NSDictionSampleViewController alloc] initWithNibName:@"NSDictionSampleViewController" bundle:nil];
    }
    else if ([selectedString isEqualToString:@"NSNumber"])
    {
        vc = [[NSNumberSampleViewController alloc] initWithNibName:@"NSNumberSampleViewController" bundle:nil];
    }
    [self.navigationController pushViewController:vc animated:YES];
}

@end
