Response.Clear();
Response.ContentType = MimeMapping.GetMimeMapping(Path.GetExtension(fileName));
Response.AppendHeader("Content-Type", MimeMapping.GetMimeMapping(fileName));
Response.AppendHeader("Content-Transfer-Encoding", "binary");
Response.AppendHeader("Content-Disposition", string.Format("attachment; filename={0}", Path.GetFileName(fileName)));
Response.BinaryWrite(memoryStream.ToArray());
Response.End();
Response.Flush();