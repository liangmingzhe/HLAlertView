//
//  HLTextField.h
//  HLAlertView
//
//  Created by benjaminlmz@qq.com on 2020/5/6.
//  Copyright © 2020 Tony. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLAlertModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,TextEditState) {
    TextEditDidBeginEditing = 0,
    TextEditDidEndEditing = 1,
    TextEditDidChangeSelection = 2,
};
@protocol HLTextFieldDelegate <NSObject>

- (void)textFieldDidBeginEditing:(UITextField *)textField;
- (void)textFieldDidEndEditing:(UITextField *)textField;
- (void)textFieldDidChangeSelection:(UITextField *)textField;

@end
@interface HLTextField : NSObject

+ (instancetype)textFieldWithBlock:(void(^)(Constraint *,HLTextModel *))block handler:(void(^ __nullable)(HLTextField *action,NSString *text,TextEditState textFieldState))handler;

@property (nonatomic,weak)id<HLTextFieldDelegate> delegate;
@property (nonatomic,copy,readonly) NSString *text;
@end

NS_ASSUME_NONNULL_END
