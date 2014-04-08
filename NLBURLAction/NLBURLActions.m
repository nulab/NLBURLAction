//
// Created by Toshitaka Agata on 4/8/14.
// Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBURLActions.h"


static NSArray *NLBURLActionsActionsClasses;
@implementation NLBURLActions

+ (void)initialize {
    NLBURLActionsActionsClasses = @[
        [NLBBacklogURLAction class],
        [NLBGoogleDriveURLAction class],
        [NLBTwitterURLAction class],
        [NLBTweetbotURLAction class],
        [NLBTypetalkURLAction class],
        [NLBYoutubeURLAction class],
        [NLBSafariURLAction class],
        [NLBPasteboardURLAction class]
    ];
}

+ (NSArray *)actionClasses {
    return NLBURLActionsActionsClasses;
}

+ (NSArray *)actionClassesWithExcludeActionClasses:(NSArray *)excludeActionClasses {
    NSMutableArray *results = [[NSMutableArray alloc] initWithArray:[self actionClasses]];
    for (Class exculudeActionClass in excludeActionClasses) {
        [results removeObject:exculudeActionClass];
    }
    return results;
}
@end