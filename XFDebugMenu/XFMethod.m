//
//  XFMethod.m
//  XFDebugMenu
//
//  Created by Manu Wallner on 27/10/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import "XFMethod.h"
#import "XFClass.h"

@implementation XFMethod

+ (instancetype)methodWithClass:(XFClass *)class andPrimitiveMethod:(Method)method {
    return [[self alloc] initWithClass:class andPrimitiveMethod:method];
}

- (instancetype)initWithClass:(XFClass *)class andPrimitiveMethod:(Method)method {
    self = super.init;
    if (self) {
        _class = class;
        _method = method;
    }
    return self;
}

- (NSInvocation *)invocationForObject:(id)object {
    if(![object isKindOfClass:NSClassFromString([self.class className])]) {
        @throw [NSException exceptionWithName:@"ClassMismatchException" reason:@"The class of the object passed is different to the method's class" userInfo:nil];
    }
    const char * types = method_getTypeEncoding(_method);
    NSMethodSignature *signature = [NSMethodSignature signatureWithObjCTypes:types];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = object;
    invocation.selector = method_getName(_method);
    return invocation;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"[%@ %@]", _class, NSStringFromSelector(method_getName(_method))];
}

@end