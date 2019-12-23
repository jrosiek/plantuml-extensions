# kafka_topic

#### kafka_topic($id, $name, $key, $compacted="")

Creates participant that represents kafka topic.

It lets you add the information what is the topic key and whether it is a compacted topic or not.

## Usage example:

```
@startuml

!preprocessorV2

!include https://raw.githubusercontent.com/jrosiek/plantuml-extensions/master/sequence/kafka-topic.iuml

kafka_topic(A, FooBarBazBooBa, foobarGUID)
kafka_topic(B, Boolaboola, bazbarGUID, compacted)

A --> B : foomsg

@enduml
```

![diagram](https://raw.githubusercontent.com/jrosiek/plantuml-extensions/master/sequence/kafka-topic-example.png)
