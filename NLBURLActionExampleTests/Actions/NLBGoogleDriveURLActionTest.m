//
//  NLBGoogleDriveURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBGoogleDriveURLAction.h"

@interface NLBGoogleDriveURLActionTest : XCTestCase

@end

@implementation NLBGoogleDriveURLActionTest

- (void)testCustomSchemeURLWithURLSuccess {
    NLBGoogleDriveURLAction *action = [[NLBGoogleDriveURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://docs.google.com/a/nulab.co.jp/spreadsheet/ccc?key=exampleKey&usp=drive_web#gid=135"]];
    XCTAssertEqualObjects(@"googledrive://docs.google.com/a/nulab.co.jp/spreadsheet/ccc?key=exampleKey&usp=drive_web#gid=135", url.absoluteString);
}

- (void)testCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBGoogleDriveURLAction *action = [[NLBGoogleDriveURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://hoge.google.com/a/nulab.co.jp/spreadsheet/ccc?key=exampleKey&usp=drive_web#gid=135"]];
    XCTAssertNil(url.absoluteString);
}

@end
