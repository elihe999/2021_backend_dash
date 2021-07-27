# elk

## stack

前提 JAVA
[主页](https://www.elastic.co/cn/elasticsearch/)

### elasticsearch

> 启动
```cmd
cd elasticsearch-<version>
./bin/elasticsearch
```

#action.destructive_requires_name: true
http.cors.enabled: true
http.cors.allow-origin: "*"

1) 网址:https://github.com/mobz/elasticsearch-head下载安装包,npm install 
2) 安装完成之后npm run start或grunt server,启动head插件

<http://mobz.github.io/elasticsearch-head/>

#### put

```
PUT http://localhost:9200/megacorp/employee/1 

{ "first_name" : "John", "last_name" : "Smith", "age" : 25, "about" : "I love to go rock climbing", "interests": [ "sports", "music" ] }
```

return 

```json
{
"_index": "megacorp",
"_type": "employee",
"_id": "1",
"_version": 1,
"result": "created",
"_shards": {
"total": 2,
"successful": 1,
"failed": 0
},
"_seq_no": 0,
"_primary_term": 1
}
```

#### GET

GET /megacorp/employee/1
GET /megacorp/employee/_search



### Logstash


### Kibana