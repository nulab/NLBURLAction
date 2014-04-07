//
//  NLBSafariURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBSafariURLAction.h"

@implementation NLBSafariURLAction

- (NSString *)name {
    return @"Safari";
}

- (NSURL *)customSchemeURLWithURL:(NSURL *)url {
    static NSRegularExpression* regex;
    if (!regex) {
        regex = [NSRegularExpression
            regularExpressionWithPattern:@"^https?[:]//.+$"
                                 options:0 error:nil];
    }
    NSTextCheckingResult *match = [regex firstMatchInString:url.absoluteString options:NSMatchingReportProgress range:NSMakeRange(0, url.absoluteString.length)];
    if (match.numberOfRanges == 1) {
        return url;
    } else {
        return nil;
    }
}

@end
