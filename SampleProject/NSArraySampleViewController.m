//
//  NSArraySampleViewController.m
//  SampleProject
//
//  Created by Leo on 3/4/15.
//  Copyright (c) 2015 Perfectidea Inc. All rights reserved.
//

#import "NSArraySampleViewController.h"

@interface NSArraySampleViewController ()

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) NSMutableArray *mutableArray;

@end

@implementation NSArraySampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //設定標題
    self.title = [NSString stringWithFormat:@"NSArray"];
    
    [self creatArray];
    [self replacing];
    [self enumarate];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)creatArray
{
    NSNumber *num = @10;
    NSString *str = @"123";
    NSArray *tmps = @[@"1", @"2", @"3"];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    self.array = @[num, str, tmps, btn, view];
    
    self.mutableArray = [NSMutableArray array];
    [self.mutableArray addObject:num];
    [self.mutableArray addObject:str];
    [self.mutableArray addObject:tmps];
    [self.mutableArray addObject:btn];
    [self.mutableArray addObject:view];
    
    
    NSLog(@"array : %@", self.array);
    NSLog(@"mutable : %@", self.mutableArray);
}

- (void)replacing
{
    NSNumber *num = @999;

    [self.mutableArray replaceObjectAtIndex:0 withObject:num];
    
    NSLog(@"mutable : %@", self.mutableArray);
}

- (void)enumarate
{
    for (id obj in self.array)
    {
        //判斷它為何種Class
        if ([obj isKindOfClass:[NSString class]])
        {
            NSLog(@"--> I'm a NSString");
        }
        else if ([obj isKindOfClass:[NSNumber class]])
        {
            NSLog(@"--> I'm a NSNumber");
        }
        else if ([obj isKindOfClass:[NSArray class]])
        {
            NSLog(@"--> I'm a NSArray");
        }
        else if ([obj isKindOfClass:[UIView class]])
        {
            NSLog(@"--> I'm a UIView");
        }
        else if ([obj isKindOfClass:[UIButton class]])
        {
            NSLog(@"--> I'm a UIButton");
        }
        NSLog(@"%@", obj);
    }
}

@end
