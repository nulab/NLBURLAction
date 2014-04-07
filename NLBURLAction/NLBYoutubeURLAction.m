//
//  NLBYoutubeURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBYoutubeURLAction.h"

@implementation NLBYoutubeURLAction


- (NSString *)name {
    return @"Youtube";
}

- (NSURL *)customSchemeURLWithURL:(NSURL *)url {
    static NSRegularExpression* regex;
    if (!regex) {
        regex = [NSRegularExpression
            regularExpressionWithPattern:@"^(https?)[:]//(youtube[.]com|m[.]youtube[.]com|www[.]youtube[.]com|youtu.be)/(.+)$"
                                                          options:0 error:nil];
    }
    NSTextCheckingResult *match = [regex firstMatchInString:url.absoluteString options:NSMatchingReportProgress range:NSMakeRange(0, url.absoluteString.length)];
    if (match.numberOfRanges == 4) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"youtube%@", [[url absoluteString] substringFromIndex:[match rangeAtIndex:1].length]]];
    } else {
        return nil;
    }
}
@end
