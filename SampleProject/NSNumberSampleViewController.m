//
//  NSNumberSampleViewController.m
//  SampleProject
//
//  Created by Leo on 3/4/15.
//  Copyright (c) 2015 Perfectidea Inc. All rights reserved.
//

#import "NSNumberSampleViewController.h"

@interface NSNumberSampleViewController ()

@property (nonatomic, strong) NSNumber *number1;
@property (nonatomic, strong) NSNumber *number2;
@property (nonatomic, strong) NSNumber *number3;

@end

@implementation NSNumberSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //設定標題
    self.title = [NSString stringWithFormat:@"NSNumber"];
    // Do any additional setup after loading the view from its nib.
    
    [self createNumber];
    [self formatNumber];
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

- (void)createNumber
{
    self.number1 = [NSNumber numberWithInteger:10];
    self.number2 = [NSNumber numberWithDouble:0.346];
    self.number3 = [NSNumber numberWithLongLong:9809811283];
    
    NSLog(@"number1 : %@", self.number1);
    NSLog(@"number2 : %@", self.number2);
    NSLog(@"number3 : %@", self.number3);
}

- (void)formatNumber
{
    NSString *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:2];
    result = [formatter  stringFromNumber:self.number3];
    
    NSLog(@"format number3 : %@", result);
    
    NSNumberFormatter *formatter2 = [[NSNumberFormatter alloc] init];
    [formatter2 setNumberStyle:NSNumberFormatterPercentStyle];
    [formatter2 setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter2 setMaximumFractionDigits:2];
    //NSLog(@"percentage target:%@ result:%@",number,[formatter  stringFromNumber:number]);
    result = [formatter2 stringFromNumber:self.number2];
    
    NSLog(@"percentage : %@", result);
    
    NSNumberFormatter *formatter3 = [[NSNumberFormatter alloc] init];
    [formatter3 setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter3 setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter3 setMaximumFractionDigits:2];
    //NSLog(@"percentage target:%@ result:%@",number,[formatter  stringFromNumber:number]);
    result = [formatter3 stringFromNumber:self.number2];
    
    NSLog(@"percentage : %@", result);
    
    NSNumberFormatter *formatter4 = [[NSNumberFormatter alloc] init];
    [formatter4 setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter4 setMaximumFractionDigits:2];
    [formatter4 setMinimumFractionDigits:2];
    //NSLog(@"round target:%@ result:%@",number,[formatter  stringFromNumber:number]);
    result = [formatter4  stringFromNumber:self.number2];
    
    NSLog(@"round : %@", result);
}

@end
