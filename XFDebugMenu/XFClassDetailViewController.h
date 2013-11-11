//
//  XFClassDetailViewController.h
//  XFDebugMenu
//
//  Created by Manu Wallner on 10/11/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XFClass;
@class XFClassDetailDataSource;

@interface XFClassDetailViewController : UITableViewController

- (id)initWithClassObject:(XFClass *)classObject;

@property (nonatomic, strong) XFClass *classObject;
@property (nonatomic, strong, readonly) XFClassDetailDataSource *dataSource;

@end
