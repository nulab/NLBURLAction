//
//  NLBURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBURLAction.h"
#import "NLBDefaultURLAction.h"

static NLBURLAction *__NLBURLActionDefault;
@implementation NLBURLAction
{
    NSArray *_actionClasses;
}
+ (void)initialize {
    __NLBURLActionDefault = [[NLBURLAction alloc] initWithActionClasses:@[]];
}

+ (NLBURLAction *)defaultURLAction {
    return __NLBURLActionDefault;
}

- (instancetype)initWithActionClasses:(NSArray *)actionClasses {
    self = [super init];
    if (self) {
        _actionClasses = [[NSMutableArray alloc] initWithCapacity:actionClasses.count];
        for (Class clazz in actionClasses) {
            [self registerActionClass:clazz];
        }
    }
    return self;
}

- (instancetype)initWithActionClasses:(NSArray *)actionClasses callbackURL:(NSURL *)callbackURL {
    self = [self initWithActionClasses:actionClasses];
    if (self) {
        self.callbackURL = callbackURL;
    }
    return self;
}

- (void)registerActionClass:(Class)actionClass {
    if ([_actionClasses containsObject:actionClass]) {
        return;
    }
    [((NSMutableArray *)_actionClasses) addObject:actionClass];
}

- (NSArray *)actions {
    NSMutableArray *actions = [NSMutableArray arrayWithCapacity:_actionClasses.count];
    for (Class actionClass in _actionClasses) {
        NSObject<NLBURLActionProtocol> *action = [[actionClass alloc] init];
        if ([action isKindOfClass:[NLBDefaultURLAction class]]) {
            ((NLBDefaultURLAction *)action).callbackURL = self.callbackURL;
        }
        [actions addObject:action];
    }
    return actions;
}

- (NSArray *)arrayURLActionsWithURL:(NSURL *)url {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSObject <NLBURLActionProtocol> *action in [self actions]) {
        if ([action canDoActionURL:url]) {
            [result addObject:action];
        }
    }
    return result;
}

@end
