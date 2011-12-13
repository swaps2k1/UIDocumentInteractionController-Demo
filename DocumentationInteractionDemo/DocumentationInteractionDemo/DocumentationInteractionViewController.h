//
//  DocumentationInteractionViewController.h
//  DocumentationInteractionDemo

#import <UIKit/UIKit.h>

@interface DocumentationInteractionViewController : UIViewController <UIDocumentInteractionControllerDelegate> {
    UIDocumentInteractionController *documentationInteractionController;
    BOOL interacting;
}

@end
