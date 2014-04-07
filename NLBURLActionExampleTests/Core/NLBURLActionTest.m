//
//  NLBURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBURLAction.h"
#import "NLBSafariURLAction.h"
#import "NLBBacklogURLAction.h"
#import "NLBTwitterURLAction.h"
#import "NLBTweetbotURLAction.h"
#import "NLBPasteboardURLAction.h"

@interface NLBURLActionTest : XCTestCase

@end

@implementation NLBURLActionTest

- (void)testCustomizeNLBURLAction {
    NLBURLAction *action = [[NLBURLAction alloc] initWithActionClasses:@[
        [NLBSafariURLAction class],
        [NLBBacklogURLAction class],
        [NLBTwitterURLAction class],
        [NLBTweetbotURLAction class],
        [NLBPasteboardURLAction class]
    ] callbackURL:[NSURL URLWithString:@"nlburlactionexmple://"]];
    NSArray *actions = [action arrayURLActionsWithURL:[NSURL URLWithString:@"https://twitter.com/agata/status/451892810430439424"]];
    XCTAssertEqual(2, actions.count);
    XCTAssertEqualObjects([NLBSafariURLAction class], [actions[0] class]);
    XCTAssertEqualObjects([NLBPasteboardURLAction class], [actions[1] class]);
}

@end
