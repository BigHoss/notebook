---
id: 2l7lbi6o39xi7olcfs8p5zq
title: fixNumberingProto
desc: ''
updated: 1688390754862
created: 1687772697722
---

fix the numbering of the message properties:

message CodeTypeApiModel {
    string id = 1;
    string name = 2;
    string hekoType = 3;
    string descriptionDe = 4;
    google.protobuf.StringValue descriptionEn = 5;
    google.protobuf.StringValue descriptionFr = 6;
    google.protobuf.StringValue descriptionIt = 7;
    google.protobuf.Timestamp createdOn = 9;
    string createdBy = 10;
    google.protobuf.Timestamp modifiedOn = 11;
    string modifiedBy = 12;
    google.protobuf.Timestamp deletedOn = 13;
    google.protobuf.StringValue deletedBy = 14;
}