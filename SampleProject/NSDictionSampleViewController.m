//
//  NSDictionSampleViewController.m
//  SampleProject
//
//  Created by Leo on 3/4/15.
//  Copyright (c) 2015 Perfectidea Inc. All rights reserved.
//

#import "NSDictionSampleViewController.h"

@interface NSDictionSampleViewController ()

@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong) NSMutableDictionary *mutableDict;

@end

@implementation NSDictionSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //設定標題
    self.title = [NSString stringWithFormat:@"NSDictionary"];
    
    [self createDictionary];
    [self modifyMutable];
    [self enumerate];
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

- (void)createDictionary
{
    NSNumber *num = @10;
    NSString *str = @"123";
    NSArray *tmps = @[@"1", @"2", @"3"];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.dict = @{@"key1" : num, @"key2" : str, @"key3" : tmps, @"key4" : btn, @"key5" : view};
//    self.dict = [NSDictionary dictionaryWithObjectsAndKeys:num, @"key1", str, @"key2", tmps, @"key3", btn, @"key4", view, @"key5", nil];
    
    NSLog(@"dict : %@", self.dict);
    
    self.mutableDict = [NSMutableDictionary dictionary];
    [self.mutableDict setObject:num forKey:@"key1"];
    [self.mutableDict setObject:str forKey:@"key2"];
    [self.mutableDict setObject:tmps forKey:@"key3"];
    [self.mutableDict setObject:btn forKey:@"key4"];
    [self.mutableDict setObject:view forKey:@"key5"];
    
    NSLog(@"mutable : %@", self.mutableDict);
}

- (void)modifyMutable
{
    NSNumber *num = @999;
    [self.mutableDict setObject:num forKey:@"key1"];
    
    NSLog(@"mutable : %@", self.mutableDict);
}

- (void)enumerate
{
    NSArray *allKeys = [self.dict allKeys];
    
    for (NSString *key in allKeys)
    {
        id obj = self.dict[key];
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
        NSLog(@"key : %@, object : %@", key, self.dict[key]);
        
    }
}



@end
