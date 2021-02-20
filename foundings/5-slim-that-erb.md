# Slim That erb

So, over the last days i have discovered a new templating engine. It's called Slim and it's perfect for slimming down those large html template files.

All the code i wrote before were in `.erb`, and i loved that i liked how `erb` is so simple and consice as it enables you to write the HTML and CSS you love, but add sprinkles of **Ruby** there and there and that is already powerfull. If you're using erb and happy with it, keep using it as there are no reasons to ditch it based on some blog post.

So, what a `.slim` file looks like? Nice of you to ask. First Let's take a look at an `erb` file

```erbruby
<article	
  data-controller="boost"	
  id="<%= dom_id boost %>"	
  class="rounded-full bg-white flex items-center justify-center px-2 py-1 my-1 mx-2 relative trix-hidden__block-tools text-xs">	
  <span	
    data-action="click->boost#toggleDeleteIconVisibility"	
    class="cursor-pointer self-start">	
    <%= boost.message %>	
  </span>	

  <%= form_for boost, method: :delete, html: {class: "self-end flex items-center"} do %>	
    <button	
      data-boost-target="deleteIcon"	
      class="focus:outline-none" aria-label="Delete boost">	
      <svg class="w-4 h-4 ml-2 text-red-600 relative z-50" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">	
        <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path>	
      </svg>	
    </button>	
  <% end %>	
</article> 
```
this was a HTML block that represented a `Boost` within Fusecamp, and after migrating it to Slim this is how it looks like 

```slim

article[
data-controller="boost"
id= dom_id(boost)
class="rounded-full bg-white flex items-center justify-center px-2 py-1 my-1 mx-2 relative trix-hidden__block-tools text-xs"]
  span[data-action="click->boost#toggleDeleteIconVisibility"
  class= "cursor-pointer self-start"]
    =boost.message

  = form_for(boost, method: :delete, html: {class: "self-end flex items-center"}) do |f|
    button[
      data-boost-target="deleteIcon"
      class="focus:outline-none"
      aria-label="Delete boost"
    ]
      svg.w-4.h-4.ml-2.text-red-600.relative.z-50 fill="currentColor" viewbox=("0 0 20 20") xmlns="http://www.w3.org/2000/svg"
        path clip-rule="evenodd" d=("M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z") fill-rule="evenodd"
```

```slim
    =boost.message
```
the `=` operator indicates a expression to execute

which is equivalent of 

```erbruby
  <%= boost.message %>	
```

in erb.

As you can see the number of lines have significantly decreased, of course there is space indentation, because indentation matters in Slim, but overall i like the aesthetic of a slim file after using erb forever, it looks more natural and reads better because of absence of tags looks more cleaner.

## Summary
- Slim is a templating engine for backend frameworks.
- The syntax is similar to Pug in nodejs.
- It's not better than erb to some extent.
- It's not a replacement to good old `erb`.

Thanks for your time to read this, see you in the next article, have a nice day.