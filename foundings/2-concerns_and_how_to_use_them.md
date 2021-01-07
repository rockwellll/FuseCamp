## Concerns
#### To concern or not ?
## 

According to rails [docs](https://api.rubyonrails.org/classes/ActiveSupport/Concern.html), is any valid **Ruby** [module](https://ruby-doc.org/core-2.5.0/Module.html) and extends the class `ActiveSupport::Concern`.
Their are some mixed opinions on **Concerns** and whether you should use them or not. For me i have liked and loved them right when i saw it and how it can benefit me and my code.
for the following reasons

1- It enables you to share a specific feature of your application with multiple models

2- It saves you keystrokes since you would just do `include ModuleName`. 

## An Example
##### In Fasecamp you have the ability to put items in the trash, which means they are not instantly deleted from the database, rather they are [soft deleted](https://en.wiktionary.org/wiki/soft_deletion#:~:text=Noun,data%20itself%20from%20the%20database.).

### say hello to our `Trashable` concern
lets look at the code for the `Trashable`

`/app/concerns/trashable.rb`

```ruby
module Trashable
  extend ActiveSupport::Concern

  included do
    default_scope do
      where deleted_at: nil
    end

    scope :trashed, -> { unscope(where: :deleted_at)}
  end
end
```

we can see that its a normal ruby module and extends rails `ActiveSupport::Concern`.

1 -when included it adds a `default_scope` to the target model which applies a `where` clause into every request that comes inside the target class. 
 so when you run any method on the target class like `TragetClass.all` underneath it inserts a `where` clause into the query.
 
2- to get all the trashed items we have added a rails `scope` that basically undo's what we wrote in the `default_scope`.
to get the trashed items we would do `TargetClass.trashed` will give you all the trashed items.

**To wrap all this up** I have created a corresponding **migration** and **model**.

`TrashItem.rb`

```ruby
class TrashItem < ApplicationRecord
  belongs_to :trash
  belongs_to :trashable, polymorphic: true
end
```

`create_trash_item.rb`
```ruby
class CreateTrashItems < ActiveRecord::Migration[6.0]
  def change
    create_table :trash_items do |t|
      t.belongs_to :trash, null: false, foreign_key: true
      t.references :trashable, polymorphic: true

      t.timestamps
    end
  end
end
```
# 

##### Thank you for taking the time to read this, see you in the next article.