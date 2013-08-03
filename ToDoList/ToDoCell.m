
#import "ToDoCell.h"
#import "ToDo.h"

@implementation ToDoCell

- (void)setToDo:(ToDo *)todo {
    self.textLabel.text = todo.text;
}

@end
