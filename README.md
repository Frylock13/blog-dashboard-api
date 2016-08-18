## README

### Demo
[Demo](http://apis.expaenergy.lclients.ru/login)
[Video](https://drive.google.com/open?id=0B1wGmGedDY1dQlowRkN6ZVktQms)
*demo:demo*

You can seed a testing data on your local project. Enter `rake db:seed` in a terminal for create of demo user and/or seed its posts. 

### API
`your_key` - it's your api key. You can find it on the API page.

#### Posts
Get hash of posts `/api/posts?api_key=your_key`

Get a specific post `/api/posts/:id?api_key=your_key`

Search posts by tags `/api/posts?api_key=your_key&tags=rails,ruby`

#### Users
Tags of user(on the Settings page): `/api/tags?api_key=your_key`

Avatar: `/api/avatar?api_key=your_key`
