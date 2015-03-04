//
//  CustomCell.h
//  SampleProject
//
//  Created by Leo on 3/4/15.
//  Copyright (c) 2015 Perfectidea Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//enum 的用法
typedef NS_ENUM(NSUInteger, ButtonTag)
{
    ButtonTagButton1 = 0,
    ButtonTagButton2 = 1,
    ButtonTagButton3 = 2
};

@protocol CustomDelegate;
@interface CustomCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *imgv;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, strong) IBOutlet UIButton *button1;
@property (nonatomic, strong) IBOutlet UIButton *button2;
@property (nonatomic, strong) IBOutlet UIButton *button3;

@property (nonatomic, weak) id <CustomDelegate> delegate;

- (IBAction)buttonPressed:(id)sender;

@end

@protocol CustomDelegate <NSObject>

- (void)customCell:(CustomCell*)cell didPressWithButtonTag:(ButtonTag)tag;

@end
