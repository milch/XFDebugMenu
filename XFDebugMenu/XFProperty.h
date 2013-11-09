//
//  XFProperty.h
//  XFDebugMenu
//
//  Created by Manu Wallner on 28/10/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@class XFVariable;

@interface XFProperty : NSObject

+ (instancetype)propertyWithPrimitive:(objc_property_t)property;

- (id)valueForObject:(id)object;
- (void)setValue:(id)value forObject:(id)object;

@property (nonatomic, strong, readonly) NSString *name;

@end
