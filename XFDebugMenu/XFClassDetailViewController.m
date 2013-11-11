//
//  XFClassDetailViewController.m
//  XFDebugMenu
//
//  Created by Manu Wallner on 10/11/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import "XFClassDetailViewController.h"
#import "XFClassDetailDataSource.h"
#import "XFRuntime.h"

@interface XFClassDetailViewController ()

@end

@implementation XFClassDetailViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        @throw [NSException exceptionWithName:@"ConstructorNotAvailableException" reason:@"This constructor is unavailable. Please use initWithClassObject:" userInfo:nil];
    }
    return self;
}

- (id)initWithClassObject:(XFClass *)classObject {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        self.classObject = classObject;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setClassObject:(XFClass *)classObject {
    if(classObject == _classObject || [_classObject isEqual:classObject]) return;
    _classObject = classObject;
    _dataSource = [[XFClassDetailDataSource alloc] initWithClassObject:_classObject];
    self.tableView.dataSource = _dataSource;
    [_dataSource configureTableView:self.tableView];
    [self.tableView reloadData];
    self.navigationItem.title = classObject.className;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
