//
//  NLBSafariURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBSafariURLAction.h"

@interface NLBSafariURLActionTest : XCTestCase

@end

@implementation NLBSafariURLActionTest

- (void)testCustomSchemeURLWithURLSuccess {
    NLBSafariURLAction *action = [[NLBSafariURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://nulab-inc.com/"]];
    XCTAssertEqualObjects(@"https://nulab-inc.com/", url.absoluteString);
}

- (void)testCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBSafariURLAction *action = [[NLBSafariURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"ftp://nulab-inc.com/"]];
    XCTAssertNil(url.absoluteString);
}

@end
