# Dashboard

The beautiful full responsive uncompromising Dashboard for your metrics that matter.

This dashboard is developed with performance and minimalism in mind.
It has a minimal set of dependencies – no relational database needed, only a Redis.
Yet it is full featured with WebSocket technology for real-time streaming your data into the UI.

## Getting started

Clone this project.
After that start integrating your widgets by copying or linking your `my_widget.*` files to the following locations.

```
app/
  +-- assets/
  |   |
  |   +-- stylesheets/
  |   |   |
  |   |   +-- widgets/
  |   |       |
  |   |       +-- my_widget.scss
  |   |
  |   +-- javascripts/
  |       |
  |       +-- widgets/
  |           |
  |           +-- my_widget.coffee
  |-- jobs/
  |   |
  |   +-- widgets/
  |       |
  |       +-- my_widget.rb
  |
  +-- views/
      |
      +-- widgets/
          |
          +--_my_widget.slim
```

It is now possible to render your widget.
Therefore edit `app/view/application/dashboard.slim` to look like the following.

```slim
/ [...]

.widget.width-2.height-2.pos-x-1.pos-y-1
  = render 'widgets/my_widget'

/ [...]
```
