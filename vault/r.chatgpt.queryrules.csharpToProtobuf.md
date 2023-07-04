---
id: wgxs85a3jhnsy49u3zlpgj0
title: csharpToProtobuf
desc: ''
updated: 1687768182790
created: 1677950304918
---

use the following ruleset to convert this c# class to a protobuf message:
align the columns of the message in the output
int? -> google.protobuf.Int32Value,
int -> int32,
string? -> google.protobuf.StringValue,
bool? -> google.protobuf.BoolValue,
DateTime -> google.protobuf.Timestamp
bool -> bool,
the property names should use camelCase instead of underscores,
the name of the message should be the following format {{ClassName}}ApiModel (example: class Persn, message: PersnApiModel)

also create a listMessage with a repeated property of the generated message


public class CodTy
{
    public string CodTyTyp { get; set; } = null!;
    public string CodTyBezeichnung { get; set; } = null!;
    public string CodTySortField { get; set; } = null!;
}
