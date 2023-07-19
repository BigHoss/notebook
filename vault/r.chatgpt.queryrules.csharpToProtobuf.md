---
id: wgxs85a3jhnsy49u3zlpgj0
title: csharpToProtobuf
desc: ''
updated: 1688727443343
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

also create a createMessage that does not have an the audit props (createdOn, createdBy, modifiedOn, modifiedBy, deletedOn, deletedBy)


public class Code 
{
    public string Id { get; set; }
    public int CodeTypeId { get; set; }
    public string? Name { get; set; }
    public string? ShortDescriptionDe { get; set; }
    public string? DescriptionDe { get; set; }
    public string? ShortDescriptionIt { get; set; }
    public string? DescriptionIt { get; set; }
    public string? ShortDescriptionFr { get; set; }
    public string? DescriptionFr { get; set; }
    public string? ShortDescriptionEn { get; set; }
    public string? DescriptionEn { get; set; }
    public string? ParentCodeId { get; set; }
    public int? Sequence { get; set; }
    public DateTime CreatedOn { get; set; }
    public string CreatedBy { get; set; } = string.Empty;
    public DateTime ModifiedOn { get; set; }
    public string ModifiedBy { get; set; } = string.Empty;
    public DateTime? DeletedOn { get; set; }
    public string? DeletedBy { get; set; }
}
