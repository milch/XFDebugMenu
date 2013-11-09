//
//  XFProperty.m
//  XFDebugMenu
//
//  Created by Manu Wallner on 28/10/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import "XFProperty.h"
#import "XFVariable.h"

@interface XFProperty ()

@property (nonatomic, readonly) objc_property_t property;

@end

@implementation XFProperty

+ (instancetype)propertyWithPrimitive:(objc_property_t)property {
    return [[XFProperty alloc] initWithPrimitive:property];
}

- (instancetype)initWithPrimitive:(objc_property_t)property {
    self = super.init;
    if (self) {
        _property = property;
        _name = @(property_getName(_property));
    }
    return self;
}

- (id)valueForObject:(id)object {
    return [object objectForKey:_name];
}

- (void)setValue:(id)value forObject:(id)object {
    [object setObject:value forKey:_name];
}


@end
