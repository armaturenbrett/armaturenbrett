# Dashboard

The beautiful full responsive uncompromising Dashboard for your metrics that matter.

This dashboard is developed with performance and minimalism in mind. It has a minimal set of dependencies – no relational database needed, only a Redis. Yet it is full featured with WebSocket technology for real-time streaming your data into the UI.

## Getting started

Clone this project. And then one of the widgets from the [Armaturenbrett organisation](https://github.com/armaturenbrett). Your folder structure may look like this:

```
container_folder/
  +-- armaturenbrett/
  |   |
  |   +-- app/
  |   |   |
  |   |   ...
  |   |
  |   ...
  | 
  |-- time/
  |   |
  |   ...
  | 
  |-- weather/
  |   |
  |   ...
  |
  ...
```


`cd` into the Armaturenbrett repo and init your setup:

```
rails armaturenbrett:init
```

And then install the widget(s) you cloned besides the Armaturenbrett repo:

```
rails widget:install[WIDGET_NAME]
```

Your folder structure now contains `config` folder:

```
container_folder/
  +-- armaturenbrett/
  |   |
  |   +-- app/
  |   |   |
  |   |   ...
  |   |
  |   ...
  |
  |-- config/
  |   |
  |   ...
  |
  |-- time/
  |   |
  |   ...
  | 
  |-- weather/
  |   |
  |   ...
  |
  ...
```

This config folder holds everything you need to set up. For instance open the `dashboard.slim` file and render the installed widgets. The install process' output or the widget's README will help you. 