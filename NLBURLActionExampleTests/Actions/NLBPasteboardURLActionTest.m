//
//  NLBPasteboardURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBPasteboardURLAction.h"

@interface NLBPasteboardURLActionTest : XCTestCase

@end

@implementation NLBPasteboardURLActionTest

- (void)testCustomSchemeURLWithURLSuccess {
    NLBPasteboardURLAction *action = [[NLBPasteboardURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://nulab-inc.com/"]];
    XCTAssertEqualObjects(@"https://nulab-inc.com/", url.absoluteString);
}

- (void)testDoActionURL {
    [[UIPasteboard generalPasteboard] setValue:[NSURL URLWithString:@"https://example.com/"] forPasteboardType:@"public.url"];
    NLBPasteboardURLAction *action = [[NLBPasteboardURLAction alloc] init];
    BOOL success = [action doActionURL:[NSURL URLWithString:@"https://nulab-inc.com/"]];
    XCTAssertEqual(true, success);
    NSURL *pastedURL = [[UIPasteboard generalPasteboard] valueForPasteboardType:@"public.url"];
    XCTAssertEqualObjects(@"https://nulab-inc.com/", pastedURL.absoluteString);
}

@end
