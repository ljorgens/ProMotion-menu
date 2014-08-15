# ProMotion-menu
This gem provides an easier way to integrate a great open source toolkit, [RubyMotion](http://www.rubymotion.com), with another great Objective-C framework, [MMDrawerController](https://github.com/mutualmobile/MMDrawerController), allowing you to easily have a cool Facebook or Path style slide navigation menu, complete with gestures.

![Travis CI](https://secure.travis-ci.org/macfanatic/promotion_slide_menu.png?branch=master)

## Installation

### Bundler

Add the following to your project's `Gemfile` to work with bundler.

```ruby
gem 'ProMotion-menu'
```

Install with bundler:

```ruby
bundle install
```

### Dependenices
This depends on motion-cocoapods and ProMotion.

### Rakefile

As of [motion-cocoapods](https://github.com/HipByte/motion-cocoapods/compare/1.3.6...1.3.7) v1.3.7, you no longer have to include a pods setup block in your project Rakefile, we can do that for you in the gem.

## Creating and Configuring a Menu
To create a menu in your application, you need to start in your AppDelegate:

```ruby
class AppDelegate < PM::Delegate

  def on_load(app, options)

    # Open the menu with your center view (initially shown) and navigation view(s) (initially hidden)
    open_menu MyGreatAppScreen.new(nav_bar: true), left: NavigationScreen

    # You can get to the instance of the menu at any time if you need to
    self.menu.controller(:left).class.name
    # => NavigationScreen

  end

end
```

## Gesture Recognition
By default you can show the menu by panning within 20 pts of the bezel and hide it by panning or tapping
the center view. It's possible to override the default behavior:

```ruby

# In AppDelegate
open_menu BodyScreen, right: MenuScreen, to_show: :pan_nav_bar, to_hide: [:pan_nav_bar, :tap_nav_bar]

# From elsewhere in your app
app_delegate.menu.to_show = :pan_center

# The following gestures are provided:

  # For to_show:
  :pan_nav_bar  # Pan anywhere on the navigation bar
  :pan_content  # Pan anywhere on the center view
  :pan_center   # Alias of above
  :pan_bezel    # Pan anywhere within 20 pts of the bezel
  :none         # No gesture recognition

  # For to_hide:
  :pan_nav_bar   # Pan anywhere on the navigation bar
  :pan_content   # Pan anywhere on the center view
  :pan_center    # Alias of above
  :pan_bezel     # Pan anywhere within the bezel of the center view
  :tap_nav_bar   # Tap the navigation bar
  :tap_content   # Tap the center view
  :tap_center    # Alias of above
  :pan_menu      # Pan anywhere on the drawer view
  :none          # No gesture recognition

```

## Toggling the Menu Current Screen
To make the slide menu present the menu from anywhere in your app:

```ruby

# Show the menu
app_delegate.menu.show(:left)

# Equivalent to
app_delegate.menu.openDrawerSide MMDrawerSideLeft, animated: true, completion: ->(c) { true }

# Hide the menu
app_delegate.menu.hide

# Equivalent to
app_delegate.menu.closeDrawerAnimated animated: true, completion: ->(c) { true }

```

## Setting up the Menu
You can use any `UIViewController` subclass you want as the menu controller, but the easiest way to provide this would be to subclass `ProMotion::TableScreen` like below:

```ruby
class NavigationScreen < ProMotion::TableScreen

  def table_data
    [{
      title: nil,
      cells: [{
        title: 'OVERWRITE THIS METHOD',
        action: :swap_center_controller,
        arguments: HomeScreen
      }]
    }]
  end

  def swap_center_controller(screen_class)
    app_delegate.menu.controller(center: screen_class)
  end

end
```

## More Information

Be sure to check out more documenation from the [cocoapod itself](http://cocoadocs.org/docsets/MMDrawerController/0.5.6/), for fun things such as gesture support for showing or dismissing drawers, custom UIBarButtonItems and more.

### Help

ProMotion is not only an easy DSL to get started. The community is very helpful and
welcoming to new RubyMotion developers. We don't mind newbie questions.

If you need help, feel free to open an issue on GitHub. If we don't respond within a day, tweet us a link to the issue -- sometimes we get busy.

### Contributing

See [CONTRIBUTING.md](https://github.com/clearsightstudio/ProMotion/blob/master/CONTRIBUTING.md).

### Primary Contributors

* Matt Brewer: [@macfanatic](https://github.com/macfanatic)
* Ryan Linton: [@ryanlntn](https://twitter.com/ryanlntn)
* Jason Stirk: [@jstirk](https://github.com/jstirk)
* Mark Rickert: [@markrickert](https://twitter.com/markrickert)
* [Many others](https://github.com/clearsightstudio/ProMotion-menu/graphs/contributors)
