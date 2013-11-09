//
//  XFVariable.m
//  XFDebugMenu
//
//  Created by Manu Wallner on 28/10/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import "XFVariable.h"

@interface XFVariable ()

@property (nonatomic) Ivar ivar;

@end

@implementation XFVariable

+ (instancetype)variableWithPrimitive:(Ivar)ivar {
    return [[XFVariable alloc] initWithPrimitive:ivar];
}

- (instancetype)initWithPrimitive:(Ivar)ivar {
    self = super.init;
    if (self) {
        _ivar = ivar;
    }
    return self;
}

- (id)valueForObject:(id)object {
    return object_getIvar(object, _ivar);
}

- (void)setValue:(id)value forObject:(id)object {
    object_setIvar(object, _ivar, value);
}

@end
