---
id: rsvFbaVPvhJGN1oo2dgIQ
title: Csharaspx
desc: Everything in here is asp.net(Webforms) specific
updated: 1672674545625
created: 1640939423614
---

## Mimetype Download

```csharp
Response.Clear();
Response.ContentType = MimeMapping.GetMimeMapping(Path.GetExtension(fileName));
Response.AppendHeader("Content-Type", MimeMapping.GetMimeMapping(fileName));
Response.AppendHeader("Content-Transfer-Encoding", "binary");
Response.AppendHeader("Content-Disposition", string.Format("attachment; filename={0}", Path.GetFileName(fileName)));
Response.BinaryWrite(memoryStream.ToArray());
Response.End();
Response.Flush();
```

## Display PDF in iFrame

```csharp
// set temp folder
var virtualPath = $"~/temp/CarPool/{requestId}_{DateTime.UtcNow.ToString("yyyy-MM-ddTHH:mm:ss", CultureInfo.InvariantCulture)}.pdf";
if (System.Diagnostics.Debugger.IsAttached)
virtualPath = $"~/temp/CarPool/CarPoolDemoFile.pdf";
// generate document
var document = GenerateDocument(requestId, employeeId, language, SaveOption.Pdf);
//Dokument in TEMP-Ordner schreiben
File.WriteAllBytes(Server.MapPath(virtualPath), document);
// load viewer with pdf file
framePreview.Src = (PathToPdfViewer + virtualPath.Replace("~/temp", "").Replace("/", "%2F")).Replace("%2F%2F", "%2F");
```
