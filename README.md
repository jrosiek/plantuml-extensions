# plantuml-extensions

Various extensions PlantUML

## Usage example:

```
@startuml

!preprocessorV2

!include https://raw.githubusercontent.com/jrosiek/plantuml-extensions/master/puml_ext.iuml

$puml_ext_include(extension-name)

' for example:
$puml_ext_include(art/logos16.iuml)

' ... your diagram here

@enduml
```

## Extensions

### Sequence diagrams

* [kafka_topic_participant](./sequence/kafka-topic-participant.md) - create participant that represents kafka topic


### Component diagrams

* [kafka_topic_component](./component/kafka-topic-component.md) - create component that represents kafka topic
