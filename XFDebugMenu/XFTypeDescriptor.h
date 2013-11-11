//
//  XFTypeDescriptor.h
//  XFDebugMenu
//
//  Created by Manu Wallner on 10/11/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XFTypeDescriptor : NSObject

+ (BOOL)isValidEncodingForDescriptor:(NSString *)encoding;
+ (instancetype)typeDescriptorWithEncoding:(NSString *)encoding;

- (instancetype)initWithEncoding:(NSString *)encoding;

@end
