//
//  ZYTableViewCell.h
//  TwoWayScrollView
//
//  Created by 张昊煜 on 15/11/8.
//  Copyright © 2015年 ZhYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZYTableViewCell;
@protocol ZYTableViewCellDelegate <NSObject>

@optional
- (void)ZYTableViewCell:(ZYTableViewCell*)ZYTableViewCell;

@end

@interface ZYTableViewCell : UITableViewCell

+ (NSString *)cellReuseIdentifier;

@property (nonatomic, assign) id<ZYTableViewCellDelegate> delegate;

@end
