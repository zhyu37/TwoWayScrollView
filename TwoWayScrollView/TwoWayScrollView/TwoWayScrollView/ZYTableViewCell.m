//
//  ZYTableViewCell.m
//  TwoWayScrollView
//
//  Created by 张昊煜 on 15/11/8.
//  Copyright © 2015年 ZhYu. All rights reserved.
//

#import "ZYTableViewCell.h"

@interface ZYTableViewCell()

@property (nonatomic, strong) UIButton *buttonView;

@end

@implementation ZYTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        [self setupUI];
    }
    return  self;
}

- (void)setupUI
{
    self.buttonView.frame = CGRectMake(10, 10, 101, 30);
    [self.buttonView setTitle:@"123" forState:UIControlStateNormal];
    [self.buttonView addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.buttonView.backgroundColor = [UIColor blackColor];
    [self addSubview:self.buttonView];
}

- (void)buttonClick
{
    if ([self.delegate respondsToSelector:@selector(ZYTableViewCell:)]) {
        [self.delegate ZYTableViewCell:self];
    }
}

+ (NSString *)cellReuseIdentifier
{
    return @"ZYTableViewCell";
}

- (UIButton *)buttonView
{
    if (!_buttonView) {
        _buttonView = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _buttonView;
}

@end
