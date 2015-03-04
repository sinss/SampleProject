//
//  CustomCell.m
//  SampleProject
//
//  Created by Leo on 3/4/15.
//  Copyright (c) 2015 Perfectidea Inc. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (void)awakeFromNib {
    self.button1.layer.cornerRadius = 5;
    self.button1.clipsToBounds = YES;
    self.button2.layer.cornerRadius = 5;
    self.button2.clipsToBounds = YES;
    self.button3.layer.cornerRadius = 5;
    self.button3.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buttonPressed:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(customCell:didPressWithButtonTag:)])
    {
        [self.delegate customCell:self didPressWithButtonTag:((UIButton*)sender).tag];
    }
}

@end
