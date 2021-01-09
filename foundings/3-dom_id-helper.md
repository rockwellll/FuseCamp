# The `dom_id` helper function
The `dom_id` helper function is one of the most underrated and mostly overlooked in *Rails*.

What's the problem that `dom_id` tries to solve?
well in any front-end code that needs  **HTML** `id` attribute, we need to find a way to make every `id`  unique inside our front-end code, which is gets really messy and it's not scalable, understandable, and extendable.

Whats the solution? it's called `dom_id`, although it's relatively really small function, the work it dose has made my life way easier since Im using [HOTWire](https://hotwire.dev/) which works with 'id's extensively.

this is the code inside `dom_id` function 

```ruby
    def dom_id(record, prefix = nil)
      if record_id = record_key_for_dom_id(record)
        "#{dom_class(record, prefix)}#{JOIN}#{record_id}"
      else
        dom_class(record, prefix || NEW)
      end
    end
```

for example if the record that is passed to the function is a `User`  with id `1` the return of the function will be `user_1` that is the name of the model along with it's id, this guranntes that every result of `dom_id` function is unqiue because every database **record** has a unique *ID*.

### Examples
Now, let's take a look at some of the code inside *FuseCamp* that previously used hardcoded `id`s that were simpley not viable.

`/app/views/todos/_todo.html.erb`

```erbruby
<%= turbo_frame_tag "todo-#{@todo.id}" do %>
      .... other code
<% end %>
```

as you can see the `id` that it's hardcoded in there is `"todo-#{@todo.id}"`, this means that i had to this everywhere, i needed to remember whther i used `-` or `_` which i always had to come back and look at the code again.
after i found out about the `dom_id` i was relieved. Since, now i dont need to remember anything because `dom_id` has taken care of everything for me.

```erbruby
<%= turbo_frame_tag dom_id @todo do %>
      .... other code
<% end %>
```

ill let you figure out the rest of why this helper function needs to be known.

Thank you for taking the time to read this, see you in the next article. Have a nice day.