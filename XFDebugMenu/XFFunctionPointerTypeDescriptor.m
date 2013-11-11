//
//  XFFunctionPointerTypeDescriptor.m
//  XFDebugMenu
//
//  Created by Manu Wallner on 10/11/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import "XFFunctionPointerTypeDescriptor.h"

@implementation XFFunctionPointerTypeDescriptor

+ (BOOL)isValidEncodingForDescriptor:(NSString *)encoding {
    return [encoding hasPrefix:@"^?"];
}

- (instancetype)initWithEncoding:(NSString *)encoding {
    self = super.init;
    if (self) {
        NSLog(@"encoding %@", encoding);
    }
    return self;
}

@end
