#import "Insomnia.h"
#import <Cordova/CDV.h>

@implementation Insomnia

- (void) keepAwake:(CDVInvokedUrlCommand*)command {
  NSString *callbackId = command.callbackId;

  // Acquire a reference to the local UIApplication singleton
  UIApplication* app = [UIApplication sharedApplication];

  if (![app isIdleTimerDisabled]) {
    [app setIdleTimerDisabled:YES];
  }
  CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
  [self.commandDelegate sendPluginResult:result callbackId:callbackId];
  
  // Hook-related configuration
  [self executeHook:@"before_keepAwake"];
}

- (void) allowSleepAgain:(CDVInvokedUrlCommand*)command {
  NSString *callbackId = command.callbackId;

  // Acquire a reference to the local UIApplication singleton
  UIApplication* app = [UIApplication sharedApplication];

  if([app isIdleTimerDisabled]) {
    [app setIdleTimerDisabled:NO];
  }
  CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
  [self.commandDelegate sendPluginResult:result callbackId:callbackId];
  
  // Hook-related configuration
  [self executeHook:@"before_allowSleepAgain"];
}

// Hook-related method
- (void) executeHook:(NSString*)hookName {
  // Implement hook execution logic here
}

@end
