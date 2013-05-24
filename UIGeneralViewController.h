
#import <UIKit/UIKit.h>
#import "GeneralConstants.h"
#import "GeneralLogic.h"

@interface UIGeneralViewController : UIViewController<UITextFieldDelegate>

-(void)ShowLoadingView;
-(void)ShowLoadingView:(NSString *)sMessage;
-(void)HideLoadingView;

-(void) ShowAlertView: (NSString *) sMessage;
@end
