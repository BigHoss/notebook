# aspX
Everything in here is asp.net(Webforms) specific

## Mimetype Download
```
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

```
//TEMP-Ordner Pfad setzen
var virtualPath = $"~/temp/CarPool/{requestId}_{DateTime.UtcNow.ToString("yyyy-MM-ddTHH:mm:ss", CultureInfo.InvariantCulture)}.pdf";
if (System.Diagnostics.Debugger.IsAttached)
virtualPath = $"~/temp/CarPool/CarPoolDemoFile.pdf";
//Dokument generieren
var document = Liebherr.MCCtec.CarPool.Reports.Request.GenerateDocument(requestId, employeeId, language, SaveOption.Pdf);
//Dokument in TEMP-Ordner schreiben
File.WriteAllBytes(Server.MapPath(virtualPath), document);
//PDF mit dem Viewer in einen iFrame laden
framePreview.Src = (ApplicationConfiguration.Parameter.GetValue("PdfViewer", "Url") + virtualPath.Replace("~/temp", "").Replace("/", "%2F")).Replace("%2F%2F", "%2F");
```
