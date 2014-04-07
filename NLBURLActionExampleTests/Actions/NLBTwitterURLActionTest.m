//
//  NLBTwitterURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBTwitterURLAction.h"

@interface NLBTwitterURLActionTest : XCTestCase

@end

@implementation NLBTwitterURLActionTest

- (void)testStatusCustomSchemeURLWithURLSuccess {
    NLBTwitterURLAction *action = [[NLBTwitterURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://twitter.com/agata/status/451892810430439424"]];
    XCTAssertEqualObjects(@"twitter://status?id=451892810430439424", url.absoluteString);
}

- (void)testStatusCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBTwitterURLAction *action = [[NLBTwitterURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://twittercom/agata/status/451892810430439424"]];
    XCTAssertNil(url.absoluteString);
}

- (void)testUserCustomSchemeURLWithURLSuccess {
    NLBTwitterURLAction *action = [[NLBTwitterURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://twitter.com/agata"]];
    XCTAssertEqualObjects(@"twitter://user?screen_name=agata", url.absoluteString);
}

- (void)testUserCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBTwitterURLAction *action = [[NLBTwitterURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://twittercom/agata"]];
    XCTAssertNil(url.absoluteString);
}

@end
