//
//  XFClassDetailDataSource.m
//  XFDebugMenu
//
//  Created by Manu Wallner on 10/11/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import "XFClassDetailDataSource.h"
#import "XFRuntime.h"

static NSString *XFClassDetailDataSourceCell = @"at.xforge.class-info-cells";

@interface XFClassDetailDataSource ()
@end

typedef NS_ENUM(uint, XFClassDetailDataSection) {
    XFClassDetailDataSectionVariables,
    XFClassDetailDataSectionProperties,
    XFClassDetailDataSectionMethods,
    XFClassDetailDataSectionClassMethods,
    XFClassDetailDataSectionCount
};

@implementation XFClassDetailDataSource

- (id)initWithClassObject:(XFClass *)classObj {
    self = super.init;
    if (self) {
        _classObject = classObj;
    }
    return self;
}

- (void)configureTableView:(UITableView *)tableView {
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:XFClassDetailDataSourceCell];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:XFClassDetailDataSourceCell];
    id object = nil;
    switch (indexPath.section) {
        case XFClassDetailDataSectionMethods:
            object = _classObject.instanceMethods[indexPath.row];
            break;
        case XFClassDetailDataSectionProperties:
            object = _classObject.properties[indexPath.row];
            break;
        case XFClassDetailDataSectionVariables:
            object = _classObject.instanceVariables[indexPath.row];
            break;
        case XFClassDetailDataSectionClassMethods:
            object = _classObject.classMethods[indexPath.row];
            break;
    }
    
    cell.textLabel.text = [object description];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title;
    switch (section) {
        case XFClassDetailDataSectionMethods:
            title = @"Methods";
            break;
        case XFClassDetailDataSectionProperties:
            title = @"Properties";
            break;
        case XFClassDetailDataSectionVariables:
            title = @"Instance Variables";
            break;
        case XFClassDetailDataSectionClassMethods:
            title = @"Class Methods";
            break;
    }
    return title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case XFClassDetailDataSectionMethods:
            return _classObject.instanceMethods.count;
        case XFClassDetailDataSectionProperties:
            return _classObject.properties.count;
        case XFClassDetailDataSectionVariables:
            return _classObject.instanceVariables.count;
        case XFClassDetailDataSectionClassMethods:
            return _classObject.classMethods.count;
        default:
            return 0;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return XFClassDetailDataSectionCount;
}


@end
