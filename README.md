1. set tests
```
be hanami db create
HANAMI_ENV=test be hanami db create
```

2. create simple show action
```
be hanami g action web 'links#show'
be hanami g model link
be hanami db migrate
HANAMI_ENV=test be hanami db migrate
```

3. create link model
check that all works correct
```
be hanami c
>> LinkRepository.new.create(url: 'google.com', key: '1234')
>> LinkRepository.new.find(1)
```

4. display link url to show action

generate
```
be hanami g action web 'links#new'
be hanami g action web 'links#create'
```

```
be hanami routes
```

```
be hanami g action web 'links#create
```

5. generate admin app

```
be hanami g app admin
be hanami g model account

be hanami db migrate
HANAMI_ENV=test be hanami db migrate
```
