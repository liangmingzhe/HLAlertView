//
//  HLTextField.m
//  HLAlertView
//
//  Created by benjaminlmz@qq.com on 2020/5/6.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "HLTextField.h"
@interface HLTextField()<UITextFieldDelegate>
@property (nonatomic ,copy) void(^hander)(HLTextField *textField,NSString *text,TextEditState textFieldState);
@property (nonatomic ,strong) UITextField *textField;
@property (nonatomic ,strong) Constraint  *constraint;
@property (nonatomic ,strong) HLTextModel *textModel;
@end
@implementation HLTextField
- (id)init {
    self = [super init];
    if (self) {
        self.textField = [[UITextField alloc] init];
        self.textModel = [[HLTextModel alloc] init];
        self.constraint = [[Constraint alloc] init];
        
    }
    return self;
}
+ (instancetype)textFieldWithBlock:(void(^)(Constraint *,HLTextModel *))block handler:(void(^ __nullable)(HLTextField *action,NSString *text,TextEditState textFieldState))handler {
    HLTextField *object = [[HLTextField alloc] init];
    object.hander = handler;
    object.textField.delegate = object;
    [object.textField setTranslatesAutoresizingMaskIntoConstraints:NO];
    block(object.constraint,object.textModel);
    return object;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    __weak typeof(self) weakSelf = self;
    self.hander(weakSelf,textField.text,TextEditDidBeginEditing);
    if ([self.delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [self.delegate textFieldDidBeginEditing:textField];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    __weak typeof(self) weakSelf = self;
    self.hander(weakSelf,textField.text,TextEditDidEndEditing);
    if ([self.delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [self.delegate textFieldDidEndEditing:textField];
    }
}

- (void)textFieldDidChangeSelection:(UITextField *)textField {
    __weak typeof(self) weakSelf = self;
    self.hander(weakSelf,textField.text,TextEditDidChangeSelection);
    _text = textField.text;
    if ([self.delegate respondsToSelector:@selector(textFieldDidChangeSelection:)]) {
        [self.delegate textFieldDidChangeSelection:textField];
    }
}
@end
