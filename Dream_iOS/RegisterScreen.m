//
//  RegisterScreen.m
//  Dream_iOS
//
//  Created by Ma Sunghoon on 2014. 1. 16..
//  Copyright (c) 2014년 Ma Sunghoon. All rights reserved.
//

#import "API.h"
#import "RegisterScreen.h"

#import "SWRevealViewController.h"
#import "UIAlertView+error.h"

@interface RegisterScreen ()

@end

@implementation RegisterScreen

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    fldEmail.layer.cornerRadius=5.0f;
    fldEmail.layer.masksToBounds=YES;
    fldEmail.layer.BorderColor=[[UIColor clearColor] CGColor];
    fldEmail.layer.borderWidth=1.0f;
    fldPassword.layer.cornerRadius=5.0f;
    fldPassword.layer.masksToBounds=YES;
    fldPassword.layer.BorderColor=[[UIColor clearColor] CGColor];
    fldPassword.layer.borderWidth=1.0f;
    fldPasswordCfm.layer.cornerRadius=5.0f;
    fldPasswordCfm.layer.masksToBounds=YES;
    fldPasswordCfm.layer.BorderColor=[[UIColor clearColor] CGColor];
    fldPasswordCfm.layer.borderWidth=1.0f;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

-(BOOL) NSStringIsValidPassword:(NSString *)checkString{
//    NSString *passwordRegex =@"^.*(?=.{7,})(?=.*d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$";
//    NSLog(@"%@",checkString);
//    NSString *passwordRegex =@"^.*(?=.{8,20})(?=.*[a-z])(?=.*[A-Z])(?=.*[\d\W]).*$";
//    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
//    NSString *stringWithPass = @"C0mp@redText";
//    BOOL isPasswordValid = [passwordTest evaluateWithObject:checkString];
    int lowerCaseLetter, upperCaseLetter, digit, specialCharacter = 0;
    NSArray *specialC = [NSArray arrayWithObjects:@"!",@"$", @"#",nil];
    NSLog(@"%@",specialC);
//    NSLog(@"%d",[checkString length]);
    if ([checkString length] > 7){
        NSLog(@"%@",checkString);
        for (int i=0; i<[checkString length]; i++){
            unichar c = [checkString characterAtIndex:i];
//            if ([[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:c]){
//                lowerCaseLetter += 1;
//                NSLog([NSString stringWithFormat:@"Lower: %d",lowerCaseLetter]);
//            } else if ([[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:c]) {
//                upperCaseLetter += 1;
//                NSLog([NSString stringWithFormat:@"Upper: %d",upperCaseLetter]);
//            } else if ([[NSCharacterSet decimalDigitCharacterSet] characterIsMember:c]) {
//                digit += 1;
//                NSLog([NSString stringWithFormat:@"Digit: %d",digit]);
//            } else if ([]){
//                specialCharacter += 1;
//                NSLog([NSString stringWithFormat:@"Special: %d",specialCharacter]);
//            }
            NSLog([NSString stringWithFormat:@"Lower: %d",lowerCaseLetter]);
            NSLog([NSString stringWithFormat:@"Upper: %d",upperCaseLetter]);
            NSLog([NSString stringWithFormat:@"Digit: %d",digit]);
            NSLog([NSString stringWithFormat:@"Special: %d",specialCharacter]);
//            if(!lowerCaseLetter) {
//                lowerCaseLetter = [[NSCharacterSet lowercaseLetterCharacterSet] characterIsMember:c];
//            }
//            if(!upperCaseLetter) {
//                upperCaseLetter = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:c];
//            }
//            if(!digit) {
//                digit = [[NSCharacterSet decimalDigitCharacterSet] characterIsMember:c];
//            }
//            if(!specialCharacter) {
//                specialCharacter = [[NSCharacterSet symbolCharacterSet] characterIsMember:c];
//            }
        }

        if (specialCharacter && digit && upperCaseLetter && lowerCaseLetter){
            return 1;
        } else {
            return 0;
        }

    }  else {
        return 0;
    }


//    return isPasswordValid;
}

-(BOOL) PasswordCfmMatchesPassword:(NSString *)checkString{
    return [fldPassword.text isEqualToString:fldPasswordCfm.text];
}

- (IBAction)fldEmailEdited:(UITextField *)sender{
    //TODO:When nothing entered(or everything removed) change border color to clear and set placeholder
    if([self NSStringIsValidEmail:fldEmail.text]){
        fldEmail.layer.BorderColor=[[UIColor blueColor] CGColor];
    } else {
        NSLog(@"FALSE");
        fldEmail.layer.BorderColor=[[UIColor redColor] CGColor];
    }
}

- (IBAction)fldPasswordEdited:(UITextField *)sender{
    if([self NSStringIsValidPassword:fldPassword.text]){
        NSLog(@"Password Validation SUccessed");
        fldPassword.layer.BorderColor = [[UIColor blueColor] CGColor];
    } else {
        NSLog(@"Password Validation FAiled");
        fldPassword.layer.BorderColor = [[UIColor redColor] CGColor];
    }
}

- (IBAction)fldPasswordCfmEdited:(UITextField *)sender {
    if([self PasswordCfmMatchesPassword:fldPasswordCfm.text]){
        fldPasswordCfm.layer.BorderColor = [[UIColor blueColor] CGColor];
    } else {
        fldPasswordCfm.layer.BorderColor = [[UIColor redColor] CGColor];
    }
}

- (IBAction)fldEmailEditFinished:(UITextField *)sender{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:fldEmail.text, @"email", nil];
    //TODO: API Call to check Email Address is Valid
    [[API sharedInstance] postToURI:[NSString stringWithFormat:@"api/valid_email/%@",fldEmail.text]
                          withParams:params
                        onCompletion:^(NSDictionary *json){
                            if(![json objectForKey:@"error"]){
                                NSLog(@"OK");
                                if([self NSStringIsValidEmail:fldEmail.text]){
                                    fldEmail.layer.BorderColor=[[UIColor blueColor] CGColor];
                                } else {
                                    fldEmail.layer.BorderColor=[[UIColor redColor] CGColor];
                                }
                            } else {
                                NSLog(@"Error");
                                fldEmail.layer.BorderColor=[[UIColor redColor] CGColor];
                            }
                        }];
}

- (IBAction)btnRegisterTapped:(UIButton *)sender{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
        fldEmail.text, @"email",
        fldPassword.text, @"password",nil];

    [[API sharedInstance] postToURI:@"/api/users"
                         withParams:params
                       onCompletion:^(NSDictionary *json){
                           if(![json objectForKey:@"error"]){

                           } else {

                           }
                       }];
}


- (IBAction)btnFBLoginTapped:(UIButton *)sender{
    // If the session state is any of the two "open" states when the button is clicked
    if (FBSession.activeSession.state == FBSessionStateOpen
            || FBSession.activeSession.state == FBSessionStateOpenTokenExtended) {

        // Close the session and remove the access token from the cache
        // The session state handler (in the app delegate) will be called automatically
        [FBSession.activeSession closeAndClearTokenInformation];

        // If the session state is not any of the two "open" states when the button is clicked
    } else {
        // Open a session showing the user the login UI
        // You must ALWAYS ask for basic_info permissions when opening a session
        [FBSession openActiveSessionWithReadPermissions:@[@"basic_info",@"email",@"user_birthday"]
                                           allowLoginUI:YES
                                      completionHandler:
                                              ^(FBSession *session, FBSessionState state, NSError *error) {

                                                  // Call the app delegate's sessionStateChanged:state:error method to handle session state changes
                                                  [self sessionStateChanged:session state:state error:error];
                                              }];
    }
}


// This method will handle ALL the session state changes in the app
- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error
{
    // If the session was opened successfully
    if (!error && state == FBSessionStateOpen){
        NSLog(@"Session opened");
        // Show the user the logged-in UI
        [self userLoggedIn];
        return;
    }
    if (state == FBSessionStateClosed || state == FBSessionStateClosedLoginFailed){
        // If the session is closed
        NSLog(@"Session closed");
        // Show the user the logged-out UI
        [self userLoggedOut];
    }

    // Handle errors
    if (error){
        NSLog(@"Error");
        NSString *alertText;
        NSString *alertTitle;
        // If the error requires people using an app to make an action outside of the app in order to recover
        if ([FBErrorUtility shouldNotifyUserForError:error] == YES){
            alertTitle = @"Something went wrong";
            alertText = [FBErrorUtility userMessageForError:error];
            [self showMessage:alertText withTitle:alertTitle];
        } else {

            // If the user cancelled login, do nothing
            if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
                NSLog(@"User cancelled login");

                // Handle session closures that happen outside of the app
            } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession){
                alertTitle = @"Session Error";
                alertText = @"Your current session is no longer valid. Please log in again.";
                [self showMessage:alertText withTitle:alertTitle];

                // For simplicity, here we just show a generic message for all other errors
                // You can learn how to handle other errors using our guide: https://developers.facebook.com/docs/ios/errors
            } else {
                //Get more error information from the error
                NSDictionary *errorInformation = [[[error.userInfo objectForKey:@"com.facebook.sdk:ParsedJSONResponseKey"] objectForKey:@"body"] objectForKey:@"error"];

                // Show the user an error message
                alertTitle = @"Something went wrong";
                alertText = [NSString stringWithFormat:@"Please retry. \n\n If the problem persists contact us and mention this error code: %@", [errorInformation objectForKey:@"message"]];
                [self showMessage:alertText withTitle:alertTitle];
            }
        }
        // Clear this token
        [FBSession.activeSession closeAndClearTokenInformation];
        // Show the user the logged-out UI
        [self userLoggedOut];
    }
}

// Show the user the logged-out UI
- (void)userLoggedOut
{
    // Set the button title as "Log in with Facebook"
    UIButton *loginButton = [self FBLoginBtn];
    [loginButton setTitle:@"Log in with Facebook" forState:UIControlStateNormal];

    // Confirm logout message
//    [self showMessage:@"You're now logged out" withTitle:@""];
}

// Show the user the logged-in UI
- (void)userLoggedIn
{
    [[API sharedInstance] setFacebookAccessToken:[[FBSession activeSession] accessTokenData]
                                    onCompletion:^(NSDictionary *json){
                                        if(![[json objectForKey:@"status"] isEqualToString:@"error"] && [[json objectForKey:@"id"] intValue] > 0){
                                            //success
                                            [[API sharedInstance]setUser: json];

                                            // Set the button title as "Log out"
                                            UIButton *loginButton = self.FBLoginBtn;
                                            [loginButton setTitle:@"Log out" forState:UIControlStateNormal];

                                            // Welcome message
                                            [self showMessage:@"You're now logged in" withTitle:@"Welcome!"];

                                            SWRevealViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DreamProjMain"];
                                            [self presentViewController:viewController animated:YES completion:nil];

                                        } else {
                                            //error!
                                            [UIAlertView error:[json objectForKey:@"reason"]];
                                        }
                                    }
    ];
}

// Show an alert message
- (void)showMessage:(NSString *)text withTitle:(NSString *)title
{
    [[[UIAlertView alloc] initWithTitle:title
                                message:text
                               delegate:self
                      cancelButtonTitle:@"OK!"
                      otherButtonTitles:nil] show];
}

@end
