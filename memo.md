# Django Reader

```
/                     : index.html
/links/               : view all urls
      /<int:pk>       : view the detail
```


```
/api/v1/              : [GET] view entrypoint of api
       /links/        : [GET] get all urls
             /        : [POST] add one
             /<int:pk>: [GET] get the detail
             /<int:pk>: [PUT] put it
             /<int:pk>: [DELETE] delete it
```






