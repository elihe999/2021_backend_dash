https://bfanger.nl/swagger-explained/#parameterObject


SWG对象描述： @SWG\Swagger  声明一个SWG全局对象

# 固定字段 
字段名称 

类型

描述

swagger|string|必要。指定正在使用的Swagger规范版本。它可以被Swagger UI和其他客户端用来解释API列表。该值必须是"2.0"。

Info|信息对象|必要。提供关于API的元数据。元数据可以由客户端使用，如果需要的话。

host|string|提供API的主机（名称或IP）。这只能是主机，不包括方案和子路径。它可能包括一个端口。如果host不包括，将使用提供文档的主机（包括端口）。在host不支持路径模板。

bashpath

string

API所服务的基本路径，相对于host。如果没有包含，则直接在API下提供API host。该值必须以一个前导斜杠（/）开始。在basePath不支持路径模板。

schemes

string

API的传输协议。值必须是从列表："http"，"https"，"ws"，"wss"。如果schemes不包含，则使用的默认方案是用于访问规范的方案。

consumes

string

API可以使用的MIME类型列表。这对所有的API都是全局的，但是可以在特定的API调用上被覆盖。值必须如MIME类型下所述。

produces

string

API可以生成的MIME类型列表。这对所有的API都是全局的，但是可以在特定的API调用上被覆盖。值必须如MIME类型下所述。

paths

操作对象

需要。API的可用路径和操作。

definitions

定义对象

一个对象，用于保存操作生成和使用的数据类型。

parameters

参数定义对象

保存可在各个操作中使用的参数的对象。该属性没有为所有操作定义全局参数。

responses

响应定义对象

保存可用于各个操作的响应的对象。这个属性没有定义全局响应的所有操作。

securityDefinitions

安全定义对象

可以在规范中使用的安全方案定义。

security

安全要求对象 

宣布哪些安全计划适用于整个API。值的列表描述了可以使用的替代安全方案（也就是说，安全需求之间存在逻辑或）。单独的操作可以覆盖这个定义。

tags

标签对象

规范使用附加元数据的标签列表。标签的顺序可以用来反映他们的解析工具的顺序。操作对象所使用的标签并非都必须声明。未声明的标签可以随机组织或基于工具的逻辑组织。列表中的每个标签名必须是唯一的。

externalDocs

外部文档对象

额外的外部文件。
————————————————
版权声明：本文为CSDN博主「风少」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/dyt19941205/article/details/79025266


信息对象描述： @SWG\Info  声明一个API版本信息

字段名称

类型

描述

title

string

需要。API的标题。

description

string

API的简短说明。

termsOfService

string

API的服务条款。

contact

联系对象

暴露的API的联系信息。

license

许可证对象

暴露的API的许可证信息。

version

string

必需提供应用程序API的版本（不要被规格版本混淆）。


————————————————
版权声明：本文为CSDN博主「风少」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/dyt19941205/article/details/79025266




请求操作对象描述： @SWG\Get/Post/Put/Delete 声明一个接口请求信息

描述路径上的单个API操作。

固定字段
字段名称

类型

描述

tags

string

接口名

summary

string

接口的简短摘要。为了在swagger-ui中获得最大的可读性，这个字段应该少于120个字符。

description

string

接口的详细解释。

externalDocs

外部文档对象

有关此操作的其他外部文档。

operationId

string

操作的友好名称。id必须在API中描述的所有操作中唯一。工具和库可以使用操作ID来唯一标识一个操作。

consumes

string

该操作可以使用的类型列表。这将覆盖consumesSwagger对象的定义。可以使用空值清除全局定义。值必须如MIME类型下所述。

produces

string

操作可以产生的类型列表。这将覆盖producesSwagger对象的定义。可以使用空值清除全局定义。值必须如MIME类型下所述。

parameters

参数对象 

适用于此操作的参数列表。如果在路径项目中已经定义了一个参数，新的定义将覆盖它，但是不能删除它。该列表不得包含重复的参数。一个独特的参数是由一个名称和位置的组合来定义的。该列表可以使用引用对象链接到在Swagger对象参数中定义的参数。最多可以有一个“身体”参数。

responses

响应对象

需要。执行此操作时返回的可能响应列表。

schemes

string

操作的传输协议。值必须是从列表："http"，"https"，"ws"，"wss"。该值将覆盖Swagger对象schemes定义。

deprecated

boolean

声明此操作将被弃用。宣布的操作的使用应该被禁止。默认值是false。

security

安全要求对象 

宣布哪些安全计划适用于此操作。值列表描述了可以使用的替代安全方案（也就是说，安全需求之间存在逻辑或）。该定义覆盖任何已声明的顶层security。要删除顶级安全声明，可以使用空数组。

path

URl 

接口请求的路由
————————————————
版权声明：本文为CSDN博主「风少」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/dyt19941205/article/details/79025266