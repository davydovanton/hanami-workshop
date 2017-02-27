```
be hanami db create
HANAMI_ENV=test be hanami db create
```

```
be hanami g action web 'links#show'
be hanami g model link
be hanami db migrate
HANAMI_ENV=test be hanami db migrate
```

check that all works correct
```
be hanami c
>> LinkRepository.new.create(url: 'google.com', key: '1234')
>> LinkRepository.new.find(1)
```
