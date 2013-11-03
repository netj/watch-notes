// watch-notes.m

#import <Foundation/Foundation.h>

@interface Observer : NSObject

- (void)observeNotification:(NSNotification*)note;

@end

@implementation Observer

- (void)observeNotification:(NSNotification*)note
{
  fprintf(stdout, "%s\t%s\n",
      [note.name UTF8String],
      [[[NSString stringWithFormat:@"%@", note.userInfo]
        stringByReplacingOccurrencesOfString:@"\n"
                                  withString:@" "]
                                  UTF8String]);
  fflush(stdout);
}

@end

int main (int argc, char const *argv[])
{
  if (argc <= 1) {
    printf(
        "Usage: %s DIST_NOTI_NAME...\n"
        "  DIST_NOTI_NAME is a full name of the OS X distributed notification to observe.\n"
        "  All distributed notification can be observed when - is given for DIST_NOTI_NAME.\n"
        , argv[0]);
    return 1;
  }
  @autoreleasepool {
    Observer* myObserver = [[Observer alloc] init];
    for (int i=1; i<argc; i++) {
      NSString* name = nil;
      if (strncmp(argv[i], "-", 2))
        name = [NSString stringWithUTF8String:argv[i]];
      [[NSDistributedNotificationCenter defaultCenter]
        addObserver:myObserver
           selector:@selector(observeNotification:)
               name:name
             object:nil
             ];
    }
    CFRunLoopRun();
  }
  return 0;
}

// vim:ft=objc:sw=2:sts=2
