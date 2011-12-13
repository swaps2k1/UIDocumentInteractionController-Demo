//
//  DocumentationInteractionViewController.m
//  DocumentationInteractionDemo

#import "DocumentationInteractionViewController.h"

@implementation DocumentationInteractionViewController

#pragma mark - View lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
    UIView *rootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    
    self.view = rootView;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void) viewDidAppear:(BOOL)animated {
    if (interacting == NO) {
        interacting = YES;
        NSString *documentPath = [[NSBundle mainBundle] pathForResource:@"xcode" ofType:@"pdf"];
        NSURL *documentURL = [NSURL fileURLWithPath:documentPath isDirectory:NO];
        documentationInteractionController = [UIDocumentInteractionController interactionControllerWithURL:documentURL];
        documentationInteractionController.delegate = self;
        [documentationInteractionController presentPreviewAnimated:YES];
    }
	[super viewDidAppear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    // Release any cached data, images, etc that aren't in use.
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark -
#pragma mark DocumentInteractionViewController delegates

- (UIViewController *) documentInteractionControllerViewControllerForPreview: (UIDocumentInteractionController *) controller {
	return self;
}

@end
