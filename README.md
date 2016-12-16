# Armaturenbrett

The beautiful full responsive uncompromising Dashboard for your metrics that matter.

This dashboard is developed with performance and minimalism in mind. It has a minimal set of dependencies – no relational database needed, only a Redis. Yet it is full featured with WebSocket technology for real-time streaming your data into the UI.

## Getting started

Create a directory for your dashboard's components and initialize a Git repository.

```
mkdir mydashboard
cd mydashboard
git init
```

Set the `$GIT_URI_PREFIX` according to your needs and add the basic Armaturenbrett as a Git submodule.

```
GIT_URI_PREFIX="https://github.com/armaturenbrett"
git submodule add "$GIT_URI_PREFIX/armaturenbrett.git"
```

Define a list of `$WIDGETS` you may want to install

```
WIDGETS=(calendar departures logations time timecount weather who-is-home)
```

and add them as a Git submodules analog to the Armaturenbrett.

```
for widget in $WIDGETS; do
	git submodule add "$GIT_URI_PREFIX/$widget.git"
done
```

Change to your Armaturenbrett component, install dependencies and initialize it.

```
cd armaturenbrett
bundle install
bundle exec rails armaturenbrett:init
```

Install the `$WIDGETS` you have previously defined.

```
for widget in $WIDGETS; do
	bundle exec rails widget:install[$widget]
done
```

The directory `mydashboard` now contains a `config` folder, that holds everything you need to set up.
For instance open the `dashboard.slim` file and render the installed widgets.
The install output of the widget's install process or the widget's README will help you.

Finally change back to the main Armaturenbrett component's folder and run

```
bundle exec foreman start
```

in order to launch your dashboard.

Generate an authentification token by running

```
bundle exec rails armaturenbrett:generate_auth_token
```

to be able to acces your dashboard under `https://example.com/?auth_token=123456789abcdef`

# Production deployment

Commit your configuration of `mydashboard` at will and deploy it with

```
git clone --recursive git@example.com:mydashboard.git
```

to any desired origin.

# Widget administration

## Install a widget

Simply add a widget as a Git submodule and install it with the Rails task.

```
git submodule add git@example.com:mywidget.git
cd armaturenbrett
bundle exec rails widget:install[mywidget]
```

## Uninstall a widget

Uninstall the widget with the Rails task.

```
cd armaturenbrett
bundle exec rails widget:uninstall[mywidget]
```

You also may want to remove the Git submodule afterwards.

## Update a widget

Update your widgets with Git as they are submodules and reinstall it.
Make sure you have a backup of your configuration.

```
git submodule update mywidget
cd armaturenbrett
bundle exec rails widget:reinstall[mywidget]
```
