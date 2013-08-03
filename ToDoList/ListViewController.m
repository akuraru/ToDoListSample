
#import "ListViewController.h"
#import "ToDoViewController.h"
#import "ToDoCell.h"
#import "ModelManager.h"
#import "ToDoViewObject.h"

@interface ListViewController ()

@end

@implementation ListViewController {
    NSMutableArray *todos;
}

- (IBAction)addTodo:(id)sender {
    [self performSegueWithIdentifier:@"Todo" sender:nil];
}
- (IBAction)edit:(id)sender {
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    todos = [[ModelManager readToDo] mutableCopy];
    [self.tableView setEditing:NO animated:NO];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Todo"]) {
        [segue.destinationViewController setToDoViewObject:[[ToDoViewObject alloc] initWithToDo:sender]];
    }
}

#pragma mark - Table view data source

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return todos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToDoCell" forIndexPath:indexPath];
    
    cell.toDo = todos[indexPath.row];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSegueWithIdentifier:@"Todo" sender:todos[indexPath.row]];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ToDo *todo = todos[indexPath.row];
        [ModelManager deleteToDo:todo];
        
        [todos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
@end
