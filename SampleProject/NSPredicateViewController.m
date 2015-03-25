//
//  NSPredicateViewController.m
//  SampleProject
//
//  Created by Leo Chang on 3/25/15.
//  Copyright (c) 2015 Perfectidea Inc. All rights reserved.
//

#import "NSPredicateViewController.h"
#import "Data.h"

@interface NSPredicateViewController ()

@property (nonatomic, strong) NSArray *basicItems;
@property (nonatomic, strong) NSArray *modelItems;

@end

@implementation NSPredicateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createArray];
    
    [self usePredicateToFilterInDictionary];
    [self usePredicateToFilterInModelArray];
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

- (void)createArray
{
    NSMutableArray *array = [NSMutableArray array];
    NSMutableArray *array2 = [NSMutableArray array];
    
    for (int i = 0; i < 100; i++)
    {
        @autoreleasepool {
            NSString *str = [NSString stringWithFormat:@"我是字串 %i", i];
            NSNumber *num = [NSNumber numberWithInteger:i];
            NSDictionary *dict = @{@"string":str, @"number":num};
            
            [array addObject:dict];
            
            Data *item = [Data new];
            item.string = str;
            item.number = num;
            
            [array2 addObject:item];
        }
    }
    
    self.basicItems = [NSArray arrayWithArray:array];
    self.modelItems = [NSArray arrayWithArray:array2];
}


- (void)usePredicateToFilterInDictionary
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"string == %@ or number = %@", @"我是字串 1", @1];
    
    NSArray *tmp = [self.basicItems filteredArrayUsingPredicate:predicate];
    
    NSLog(@"result : %@", tmp);
    
    //陣列中有包含資料的　 [c] : 表示大、小寫都可以
    predicate = [NSPredicate predicateWithFormat:@"string contains[c] %@ or number == %@", @"字串", @1];
    
    tmp = [self.basicItems filteredArrayUsingPredicate:predicate];
    
    NSLog(@"result : %@", tmp);
}

- (void)usePredicateToFilterInModelArray
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"string == %@ or number = %@", @"我是字串 1", @1];
    
    NSArray *tmp = [self.modelItems filteredArrayUsingPredicate:predicate];
    
    NSLog(@"result : %@", tmp);
    
    //陣列中有包含資料的　 [c] : 表示大、小寫都可以
    predicate = [NSPredicate predicateWithFormat:@"string contains[c] %@ or number == %@", @"字串", @1];
    
    tmp = [self.modelItems filteredArrayUsingPredicate:predicate];
    
    NSLog(@"result : %@", tmp);
}
@end
