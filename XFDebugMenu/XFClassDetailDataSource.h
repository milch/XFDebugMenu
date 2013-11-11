//
//  XFClassDetailDataSource.h
//  XFDebugMenu
//
//  Created by Manu Wallner on 10/11/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XFClass;
@interface XFClassDetailDataSource : NSObject <UITableViewDataSource>

- (id)initWithClassObject:(XFClass *)classObj;
- (void)configureTableView:(UITableView *)tableView;

@property (nonatomic, strong, readonly) XFClass *classObject;
@end
