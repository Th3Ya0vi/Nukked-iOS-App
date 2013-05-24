
#import "UIGeneralViewController.h"

@interface UIGeneralViewController ()

@end

@implementation UIGeneralViewController

-(void)ShowLoadingView
{
    [self ShowLoadingView:LOADING_PLEASE_WAIT_MESSAGE];
}
-(void)ShowLoadingView:(NSString *)sMessage
{
    [[NSNotificationCenter defaultCenter] postNotificationName:SHOW_LOADING_VIEW_NOTIFICATION_NAME
                                                        object:sMessage];
}

-(void)HideLoadingView
{
    [[NSNotificationCenter defaultCenter] postNotificationName:HIDE_LOADING_VIEW_NOTIFICATION_NAME
                                                        object:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder] ;
    return YES ;
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

-  (void) ShowAlertView:(NSString *)sMessage
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Message"
                          message: sMessage
                          delegate: nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [alert show];
}

@end
