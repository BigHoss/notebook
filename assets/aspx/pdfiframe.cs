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