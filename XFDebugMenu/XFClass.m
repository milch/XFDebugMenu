//
//  XFClass.m
//  XFDebugMenu
//
//  Created by Manu Wallner on 27/10/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import "XFClass.h"
#import <objc/runtime.h>
#import "XFMethod.h"

@implementation XFClass {
    NSArray *_instanceMethods, *_classMethods, *_properties, *_protocols;
    XFClass *_superClass;
}


static NSMutableDictionary *classes = nil;
+ (instancetype)classWithClassName:(NSString *)className {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        classes = [NSMutableDictionary dictionary];
    });
    if(classes[className]) return classes[className];
    
    classes[className] = [[XFClass alloc] initWithClassName:className];
    
    return classes[className];
}

- (instancetype)initWithClassName:(NSString *)className {
    self = super.init;
    if (self) {
        _className = className;
    }
    return self;
}

- (XFClass *)superClass {
    if (_superClass) return _superClass;
    Class cls = NSClassFromString(_className);
    if(!cls) return nil;
    _superClass = [XFClass classWithClassName:NSStringFromClass(class_getSuperclass(cls))];
    return _superClass;
}

- (NSArray *)createMethodsFromClass:(Class)cls {
    NSMutableArray *array = [NSMutableArray array];
    uint count = 0;
    Method *methods = class_copyMethodList(cls, &count);
    
    for (int idx = 0; idx < count; idx++) {
        Method m = methods[idx];
        XFMethod *method = [XFMethod methodWithClass:self andPrimitiveMethod:m];
        [array addObject:method];
    }
    
    free(methods);
    return array;
}

#define lazy_init_methods(name, class) \
    if (name) return name; \
    name = [self createMethodsFromClass:class]; \
    return name;

- (NSArray *)instanceMethods {
    lazy_init_methods(_instanceMethods, NSClassFromString(_className));
}

- (NSArray *)classMethods {
    Class cls = NSClassFromString(_className);
    lazy_init_methods(_classMethods, object_getClass(cls));
}

#undef lazy_init_methods

- (NSArray *)properties {
    if (_properties) return _properties;
    uint count = 0;
    NSMutableArray *arr = [NSMutableArray array];
    objc_property_t *properties = class_copyPropertyList(NSClassFromString(self.className), &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        
    }
    
    free(properties);
    _properties = arr.copy;
    return _properties;
}

- (NSString *)description {
    return _className;
}

@end