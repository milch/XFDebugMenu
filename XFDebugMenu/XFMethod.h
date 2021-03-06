//
//  XFMethod.h
//  XFDebugMenu
//
//  Created by Manu Wallner on 27/10/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@class XFClass;
@interface XFMethod : NSObject

+ (instancetype) methodWithClass:(XFClass *)class andPrimitiveMethod:(Method)method;

- (NSInvocation *)invocationForObject:(id)object;

@property (nonatomic, strong, readonly) XFClass *class;
@property (nonatomic, readonly) Method method;

@end
