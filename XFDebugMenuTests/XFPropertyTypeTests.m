//
//  XFPropertyTypeTests.m
//  XFDebugMenu
//
//  Created by Manu Wallner on 10/11/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "XFProperty.h"
#import "XFClass.h"

@interface __XFClassToTest : NSObject

@property char charDefault;
@property(getter=intGetFoo, setter=intSetFoo:) int intSetterGetter;
@property(readonly) int intReadonly;
@property(getter=isIntReadOnlyGetter, readonly) int intReadonlyGetter;
@property(readwrite) int intReadwrite;
@property(nonatomic, readonly, copy) id idReadonlyCopyNonatomic;
@property(nonatomic, readonly, retain) id idReadonlyRetainNonatomic;

@end

@implementation __XFClassToTest

@end

@interface XFPropertyTypeTests : XCTestCase

@property (nonatomic, strong) XFClass *classToTest;

@end

@implementation XFPropertyTypeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _classToTest = [XFClass classWithClassName:@"__XFClassToTest"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testModifiers {
    XFProperty *modifiersProperty1 = [self findProperty:@"idReadonlyCopyNonatomic"];
    XFProperty *modifiersProperty2 = [self findProperty:@"idReadonlyRetainNonatomic"];
    
    XCTAssertTrue(modifiersProperty1.isNonAtomic, @"Property should be nonatomic!");
    XCTAssertTrue(modifiersProperty2.isNonAtomic, @"Property should be nonatomic!");
    
    XCTAssertTrue(modifiersProperty1.isReadOnly, @"Property should be readonly!");
    XCTAssertTrue(modifiersProperty2.isReadOnly, @"Property should be readonly!");
    
    XCTAssertTrue(modifiersProperty1.isCopied, @"Property should be copied!");
    XCTAssertTrue(modifiersProperty2.isReferenced, @"Property should be retained!");
}

- (void)testReadWrite {
    XFProperty *readWrite = [self findProperty:@"intReadwrite"];
    XCTAssertFalse(readWrite.isReadOnly, @"The readWrite property shouldn't be readonly!");
}

- (void)testGetterAndReadonly {
    XFProperty *readOnly = [self findProperty:@"intReadonlyGetter"];
    XCTAssertTrue(readOnly.isReadOnly, @"The property should be readonly!");
    XCTAssertEqualObjects(readOnly.customGetterName, @"isIntReadOnlyGetter", @"The property should have a custom getter!");
}

- (void)testReadOnly {
    XFProperty *readOnly = [self findProperty:@"intReadonly"];
    XCTAssertTrue(readOnly.isReadOnly, @"The property should be readonly!");
}

- (void)testCustomSetterAndGetter {
    XFProperty *customSetGet = [self findProperty:@"intSetterGetter"];
    
    XCTAssertEqualObjects(customSetGet.customGetterName, @"intGetFoo", @"Should have found the custom getter!");
    XCTAssertEqualObjects(customSetGet.customSetterName, @"intSetFoo:", @"Should have found the custom setter!");
}

- (void)testCharProperty {
    XFProperty *charProp = [self findProperty:@"charDefault"];
    
    XCTAssertNotNil(charProp, @"The Class should have a charDefault Property!");
    XCTAssertFalse(charProp.isWeak, @"The char property should not be weak!");
    XCTAssertFalse(charProp.isReferenced, @"The char property should not be a reference!");
    XCTAssertFalse(charProp.isReadOnly, @"The char property should not be read only");
    XCTAssertFalse(charProp.isNonAtomic, @"The char property should be atomic");
    XCTAssertFalse(charProp.isGarbageCollected, @"The char property should not be garbage collected!");
    XCTAssertFalse(charProp.isDynamic, @"The char property should not be dynamic");
    XCTAssertFalse(charProp.isCopied, @"The char property should not be copied");
}

- (XFProperty *)findProperty:(NSString *)propertyName {
    for (XFProperty *property in _classToTest.properties) {
        if ([property.name isEqualToString:propertyName]) {
            return property;
        }
    }
    return nil;
}

@end
