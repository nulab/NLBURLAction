//
//  NLBBacklogURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBBacklogURLAction.h"

@interface NLBBacklogURLActionTest : XCTestCase

@end

@implementation NLBBacklogURLActionTest

- (void)testCustomSchemeURLWithURLSuccess {
    NLBBacklogURLAction *action = [[NLBBacklogURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://example.backlog.jp/view/NLB-123"]];
    XCTAssertEqualObjects(@"nulabbacklog://example.backlog.jp/issue/NLB-123", url.absoluteString);
}

- (void)testCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBBacklogURLAction *action = [[NLBBacklogURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://examplebacklogjp/view/NLB-123"]];
    XCTAssertNil(url.absoluteString);
}

@end
