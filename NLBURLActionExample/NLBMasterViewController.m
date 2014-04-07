//
//  NLBMasterViewController.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBMasterViewController.h"
#import "NLBURLAction.h"
#import "NLBPasteboardURLAction.h"
#import "NLBSafariURLAction.h"
#import "NLBBacklogURLAction.h"
#import "NLBTwitterURLAction.h"
#import "NLBTweetbotURLAction.h"
#import "NLBGoogleDriveURLAction.h"
#import "NLBYoutubeURLAction.h"

@interface NLBMasterViewController () {
    NSMutableArray *_objects;
    NSMutableArray *_actions;
    NLBURLAction *_urlAction;
    NSURL *_selectedURL;
}
@end

@implementation NLBMasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _urlAction = [[NLBURLAction alloc] initWithActionClasses:@[
        [NLBBacklogURLAction class],
        [NLBGoogleDriveURLAction class],
        [NLBTwitterURLAction class],
        [NLBTweetbotURLAction class],
        [NLBSafariURLAction class],
        [NLBPasteboardURLAction class],
        [NLBYoutubeURLAction class]
    ] callbackURL:[NSURL URLWithString:@"nlburlactionexmple://"]];

    _objects = [[NSMutableArray alloc] initWithArray:@[
        @"http://nulab-inc.com/",
        @"https://twitter.com/agata/status/451892810430439424",
        @"https://docs.google.com/a/nulab.co.jp/spreadsheets/d/1PROWBryAUgqjFEvgLBS2j6BM9oDqJRxHMLdBQhSCwaU/edit#gid=0",
        @"https://example.backlog.jp/view/DEMO-1",
        @"https://example.backlogtool.com/view/DEMO-1",
        @"https://www.youtube.com/watch?v=5NV6Rdv1a3I&feature=kp"
    ]];

    if (![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://status?id=451892810430439424"]]
        || ![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"https://www.youtube.com/watch?v=5NV6Rdv1a3I&feature=kp"]]) {
        UIAlertView *alert =
            [[UIAlertView alloc]
                initWithTitle:@"Information"
                      message:@"Please install Twitter or Youtube. And then test this app"
                     delegate:nil
            cancelButtonTitle:nil
            otherButtonTitles:@"OK", nil
            ];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedURL = [NSURL URLWithString:_objects[indexPath.row]];
    NSArray *actions = [_urlAction arrayURLActionsWithURL:_selectedURL];
    _actions = [[NSMutableArray alloc] init];
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"Action" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
    for (NSObject <NLBURLActionProtocol> *action in actions) {
        NSString *title = [action class] == [NLBPasteboardURLAction class] ? @"Copy link" : [NSString stringWithFormat:@"Open in %@", action.name];
        [as addButtonWithTitle:title];
        [_actions addObject:action];
    }
    as.cancelButtonIndex = [as addButtonWithTitle:@"Cancel"];
    [as showInView:self.view];
}

- (void) actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.cancelButtonIndex == buttonIndex) {
        return;
    }
    NSObject <NLBURLActionProtocol> *action = _actions[buttonIndex];
    [action doActionURL:_selectedURL];
}

@end
