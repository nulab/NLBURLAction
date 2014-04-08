//
//  NLBYoutubeURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBGoogleMapsURLAction.h"

@implementation NLBGoogleMapsURLAction


- (NSString *)name {
    return @"Google Maps";
}

- (NSURL *)customSchemeURLWithURL:(NSURL *)url {
    static NSRegularExpression* regex;
    if (!regex) {
        regex = [NSRegularExpression
            regularExpressionWithPattern:@"^(https?)[:]//((www[.]google[.]([.a-z]+)|goo[.]gl)/maps/.+)$"
                                                          options:0 error:nil];
    }
    NSTextCheckingResult *match = [regex firstMatchInString:url.absoluteString options:NSMatchingReportProgress range:NSMakeRange(0, url.absoluteString.length)];
    if (match.numberOfRanges == 5) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"comgooglemaps%@", [[url absoluteString] substringFromIndex:[match rangeAtIndex:1].length]]];
    } else {
        return nil;
    }
}
@end
