## README

### ENV
Export your password in terminal `export USERNAME=something` or set it in the *controllers/home_controller.rb*. Visit homepage, enter this value in field.

### API
You can find useful information in API page.

`:name` - is your name.
```
/api/users/:name/posts.json
/api/users/:name/posts/:id.json
```

```
/api/users/:name/posts/tags.json
/api/users/:name/posts/tags/:name.json
```