# Vancity Guide

Vancity Guide is a simple tourist information web application for the city of Vancouver, Canada. Visitors can browse attractions that have been posted to the website, or create an account and contribute their own.

Only administrators can mark attractions as "featured" which causes them to be added to the interactive map.

The default admin email address is `admin@example.com` and the password is `password`.

**NOTE:** Points of interest are refered to as `Pois` in the code, but "attractions" in the user interface.

## Resources

The application has the following resources and actions:

* **home**: home
* **contact**: new, create
* **sessions**: new, create
* **registrations**: new, create, edit, update
* **passwords**: new, create, edit, update
* **pois**: index, show, new, create, edit, update, destroy
* **bookmarks**: index, show, create, update, destroy

## Best practices

### Boilerplate

I have used a boilerplate based on the [HTML5 Boilerplate](https://html5boilerplate.com/). Unneeded parts such as [PWA](https://developer.mozilla.org/en-US/docs/Web/Progressive_web_apps) support, apache config files, robots.txt, etc. have been removed. Normalize.css has been included, however, to reset browser styles to sensible defaults.

### Unobtrusive JavaScript

Scripts are only every bound to DOM elements using HTML data attributes prefixed with `data-js-`, so that it is clear what elements are modified after the initial page load.

To meet the assignment requirement of using jQuery, the rails-ujs library was replaced with [jquery-ujs](https://github.com/rails/jquery-ujs).

### CSS architecture

I used the [ITCSS](https://www.xfive.co/blog/itcss-scalable-maintainable-css-architecture/) architecture to organize my CSS code, in order to ensure maintainability.

### Separation of concerns

Overall, seperation of functionality, structure and presentation are maintained. I did find it neccesary, however, to include some JavaScript code on the page in `<script>` tags in a few places.

### Progressive enhancement

The app should be fully functional with JavaScript disabled. However, the map will not load in such an event.

New CSS properties have been used in some places, but should gracefully degrade in older browsers.

### Responsive design

The app was built mobile-first and adapts to the screen size of the user's device.

### Semantic HTML

HTML tag sematics are respected throughout the project.

## Advanced features

### Devise authentication

Authentication has been implemented using the Devise library. The models and views provided have been customized to the application.

### Validator

A custom validator has been implemented to validate URLS.

### SVG Sprite

Images have been combined into a single SVG file to cut down on the number of requests a user's browser need to make when loading the application.