mapping，就是index的type的元数据，每个type都有一个自己的mapping，决定了数据类型，建立倒排索引的行为，还有进行搜索的行为
* string/text
* byte,short,integer,long
* float,double
* boolean
* date

```
PUT /school_rank_v1/?pretty
{
      "settings" : {
        "index":{
            "refresh_interval": "30s",
            "auto_expand_replicas" : "0-all",
                "number_of_shards" : "5",
            "translog": { "sync_interval" : "5s", "durability" : "async" },
            "indexing": { "slowlog" : { "threshold" : { "index" : { "warn" : "3s" }}}},
            "search": { "slowlog" : { "threshold" : { "fetch" : { "info" : "500ms" }, "query" : { "info" : "1m" }}}},
             "analysis": { "analyzer": { "title_analyzer": { "type" : "custom", "tokenizer": "whitespace"} }}
         }
      },
      "mappings" : {
          "rank": {
            "dynamic": "strict",
              "properties": {
                  "school_name": { "type": "text", "analyzer": "ik_max_word", "search_analyzer": "ik_smart" },
                  "area_code": { "type": "text" },
                  "address": { "type": "keyword" },
                  "logo": { "type": "keyword" },
                  "school_type":{ "type": "keyword" },
                  "school_id":{ "type": "long" },
                  "level":{ "type": "text", "analyzer": "title_analyzer" },
                  "status":{ "type": "integer" },
                  "es_update_time" : {"type": "date"},
                  "rank":{ "type": "integer" }
              }
          }
    }
}
```


ES 的查询技巧：
1. 像这种 integer/long 类的 过滤条件，尽可能写在 filter context 里。
2. 自然语言检索应该用 "match" 查询，"term" 是不分词当成整体的。 
3. 默认的 "match" 查询是 or 关系，比如 "大码"，切词成 "大" + "码" ，会召回含有 "大" or 含有 "码" 的文档。
    这个 or 会导致准确率低，先改成这种  "operator" : "and"，就会会召回含有 "大" and 含有 "码" 的文档，确保准确率高。然后再引入 rewrite 等 query 扩展策略，来提高召回率。

KeyWord & Text 的区别
keyword：存储数据时候，不会分词建立索引
text：存储数据时候，会自动分词，并生成索引（这是很智能的，但在有些字段里面是没用的，所以对于有些字段使用text则浪费了空间）。
配置type的dynamic=strict，禁止未定义字段自动被添加到索引。

### 别名
在elasticsearch里面给index起一个aliases (别名) 能优雅解决两个索引无缝切换的问题，这个功能在某些场景下非常使用。
如果你发现  student_v1 的Index有问题,他有一个alias (叫做student）,需重新构建，就可以再建一个 student_v2, 检查无误后，给他命名一个alias 也是student,这样就能无缝切换索引。在外部无感知的情况下完成切换。

### ES 查询技巧：
1. 只要不是text类型的字段，尽量（必须）使用filter过滤，因为它支持结果缓存，性能最佳。全文检索必须使用must而不是filter，否则将导致filter缓存失效。
2. 自然语言检索应该用 "match" 查询，"term" 是不分词当成整体的。
3 通过termvector 来判断一个字段的切分状况



```
POST school_rank_v1/_analyze
{
  "field": "school_name",
  "text": "香港中文大学"
}
```


