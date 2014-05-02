//
//  NLBGoogleDocsURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBGoogleDocsURLAction.h"

@implementation NLBGoogleDocsURLAction


- (NSString *)name {
    return @"Google Docs";
}

- (NSURL *)customSchemeURLWithURL:(NSURL *)url {
    static NSRegularExpression* regex;
    if (!regex) {
        regex = [NSRegularExpression
            regularExpressionWithPattern:@"^https[:]//docs[.]google[.]com/((.+)/documents?/(.+))$"
                                                          options:0 error:nil];
    }
    NSTextCheckingResult *match = [regex firstMatchInString:url.absoluteString options:NSMatchingReportProgress range:NSMakeRange(0, url.absoluteString.length)];
    if (match.numberOfRanges == 4) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"googledocs%@", [[url absoluteString] substringFromIndex:5]]];
    } else {
        return nil;
    }
}
@end
