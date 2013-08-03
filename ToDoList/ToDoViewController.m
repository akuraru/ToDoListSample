
#import "ToDoViewController.h"
#import "ToDoViewObject.h"
#import "ModelManager.h"

@interface ToDoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *todoText;

@property (nonatomic) ToDoViewObject *viewObject;

@end

@implementation ToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.todoText.text = self.viewObject.text;
}

- (void)setToDoViewObject:(ToDoViewObject *)viewObject {
    self.viewObject = viewObject;
}
- (IBAction)save:(id)sender {
    self.viewObject.text = self.todoText.text;
    
    [ModelManager insertOrUpdateToDo:self.viewObject];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
