//
//  SENTextField.m
//  百思不得姐SEN
//
//  Created by sendo on 16/12/7.
//  Copyright © 2016年 sendo. All rights reserved.
//

#import "SENTextField.h"
#import <objc/runtime.h>

static NSString * const SENPlaceholderColorKeyPath = @"_placeholderLabel.textColor";

@implementation SENTextField

//+ (void)initialize{
//    [self getIvars];
//}
//
//+ (void)getIvars{
//    unsigned int count = 0;
//    Ivar *ivars = class_copyIvarList([UITextField class], &count);
//    
//    for (int i = 0; i<count; i++) {
//        Ivar ivar = ivars[i];
//        SENLog(@"%s---%s",ivar_getName(ivar),ivar_getTypeEncoding(ivar));
//    }
//    
//    free(ivars);
//}

- (void)awakeFromNib{
    self.tintColor = self.textColor;
    [self resignFirstResponder];
}

- (BOOL)becomeFirstResponder{
    
    [self setValue:self.textColor forKeyPath:SENPlaceholderColorKeyPath];
    return [super becomeFirstResponder];
}

- (BOOL)resignFirstResponder{

    [self setValue:[UIColor grayColor] forKeyPath:SENPlaceholderColorKeyPath];
    return [super resignFirstResponder];
}

@end
