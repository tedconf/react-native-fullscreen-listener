#import "RNFullscreenListener.h"


@implementation RNFullscreenListener

RCT_EXPORT_MODULE()


- (void)startObserving
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                                selector:@selector(didEnterFullscreen)
                                                    name:UIWindowDidBecomeVisibleNotification
                                                    object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(didExitFullscreen)
                                                name:UIWindowDidBecomeHiddenNotification
                                                object:nil];
}

- (void)stopObserving
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"fullscreenChanged"];
}

- (void)didExitFullscreen {
    [self fullScrenChanged:NO];
}

- (void)didEnterFullscreen {
    [self fullScrenChanged:YES];
}

- (void)fullScrenChanged:(BOOL )fullscreen
{
    [self sendEventWithName:@"fullscreenChanged" body:@{@"fullscreen": [NSNumber numberWithBool:fullscreen]}];
}

@end
