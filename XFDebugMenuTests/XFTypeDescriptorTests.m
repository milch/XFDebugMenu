//
//  XFTypeDescriptorTests.m
//  XFDebugMenu
//
//  Created by Manu Wallner on 11/11/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XFTypeDescriptor.h"

@interface XFTypeDescriptorTests : XCTestCase

@end

@implementation XFTypeDescriptorTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEquality {
    XFTypeDescriptor *firstType = [XFTypeDescriptor typeDescriptorWithEncoding:@(@encode(unsigned int ** [12]))];
    XFTypeDescriptor *secondType = [XFTypeDescriptor typeDescriptorWithEncoding:@(@encode(unsigned int ** [12]))];
    
    XCTAssertEqualObjects(firstType, secondType, @"Both types should be equal!");
}

- (void)testIntTypes {
    XFTypeDescriptor *intType = [XFTypeDescriptor typeDescriptorWithEncoding:@(@encode(int))];
    XFTypeDescriptor *unsignedIntType = [XFTypeDescriptor typeDescriptorWithEncoding:@(@encode(unsigned int))];
    
    
}

@end
