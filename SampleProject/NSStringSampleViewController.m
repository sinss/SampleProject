//
//  NSStringSampleViewController.m
//  SampleProject
//
//  Created by Leo on 3/4/15.
//  Copyright (c) 2015 Perfectidea Inc. All rights reserved.
//

#import "NSStringSampleViewController.h"

@interface NSStringSampleViewController ()

@property (nonatomic, strong) NSString *sampleString;
@property (nonatomic, strong) NSMutableString *mutableString;
@end

@implementation NSStringSampleViewController

- (void)viewDidLoad {
    //設定標題
    self.title = [NSString stringWithFormat:@"NSString"];
    [super viewDidLoad];
    
    [self createString];
    [self subString];
    [self addCompoment];
    [self addExt];
    [self addStringToMutableString];
    [self splitString];
    [self replacing];
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

- (void)createString
{
    self.sampleString = [NSString stringWithFormat:@"建立一個字串 , 我是一隻雞 , 你是一隻鴨"];
    //另一個方法
//    self.sampleString = [[NSString alloc] initWithFormat:@"建立一個字串 , 我是一個字串 , 字串第三行"];
    self.mutableString = [NSMutableString string];
    
    NSLog(@"%@", self.sampleString);
}

- (void)subString
{
    /*
     NSRange --> 一個struct
     */
    NSString *subString = [self.sampleString substringWithRange:NSMakeRange(0, 2)];
    
    NSLog(@"subString : %@", subString);
}

- (void)addCompoment
{
    NSString *tmp  = [self.sampleString stringByAppendingPathComponent:@"GOOD"];
    
    NSLog(@"addComponent : %@", tmp);
}

- (void)addExt
{
    NSString *tmp = [self.sampleString stringByAppendingPathExtension:@"pdf"];
    
    NSLog(@"addExt : %@", tmp);

}

- (void)addStringToMutableString
{
    [self.mutableString appendFormat:@"I'm %@ !!!", @"mutable"];
    
    NSLog(@"addStringToMutableString : %@", self.mutableString);
}

- (void)splitString
{
    NSArray *tmp = [self.sampleString componentsSeparatedByString:@","];
    
    NSLog(@"split : %@", tmp);
}

- (void)replacing
{
    NSString *tmp = [self.sampleString stringByReplacingOccurrencesOfString:@"一個" withString:@"十個"];
    
    NSLog(@"replacing : %@", tmp);
}

@end
