Post.delete_all

Post.create(posted: Date.current - 3.days, title: 'Ruby on Rails', author: 'bob', body: 'ruby on rails is a mvc framework')
Post.create(posted: Date.current - 7.weeks, title: 'Python and Django', author: 'susan', body: 'python is good for scientific endeavors')
Post.create(posted: Date.current - 9.months, title: 'Node and Coffeescript', author: 'jill', body: 'node is lightning fast')
