//
//  XFClassesViewController.m
//  XFDebugMenu
//
//  Created by Manu Wallner on 10/11/13.
//  Copyright (c) 2013 XForge. All rights reserved.
//

#import "XFClassesViewController.h"
#import "XFClassDetailViewController.h"
#import "XFRuntime.h"

@interface XFClassesViewController ()

@end

@implementation XFClassesViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"className" ascending:YES];
    _classes = [[[XFRuntime sharedRuntime] classes] sortedArrayUsingDescriptors:@[descriptor]];
    self.navigationItem.title = @"Classes";

    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"Cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _classes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    XFClass *class = _classes[indexPath.row];
    cell.textLabel.text = class.className;
    
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    XFClassDetailViewController *detailViewController = [[XFClassDetailViewController alloc] initWithClassObject:self.classes[indexPath.row]];
    [self.navigationController pushViewController:detailViewController animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
