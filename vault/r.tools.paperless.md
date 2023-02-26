---
id: d9tzel9uhis6pbe58wgil3g
title: Paperless
updated: 1677450621
created: 1676745187832
Tags: office
desc: null
---

[Docs](https://docs.paperless-ngx.com/)

Paperless-ngx is a community-supported open-source document management system that transforms your physical documents into a searchable online archive so you can keep, well, less paper.

it has a well implemented api


to send documents with c# to it you can use [[r.code.dotnet.refit]]

the interface for refit will look simething like this:

```csharp
using System.IO;
using System.Threading.Tasks;
using Refit;

namespace PaperlessNgxApi
{
    public interface IPaperlessNgxApi
    {
        [Get("/documents")]
        Task<List<Document>> GetDocuments();

        [Get("/documents/{id}")]
        Task<Document> GetDocument(int id);

        [Multipart]
        [Post("/documents")]
        Task<Document> CreateDocument([AliasAs("document")] Stream pdfDocument, [Query] string title);

        [Put("/documents/{id}")]
        Task<Document> UpdateDocument(int id, [Body] Document document);

        [Delete("/documents/{id}")]
        Task DeleteDocument(int id);
    }

    public class Document
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
    }
}
```

and the code to do it

```csharp
using System.IO;
using Refit;

namespace PaperlessNgxApi
{
    class Program
    {
        static async Task Main(string[] args)
        {
            var paperlessNgxApi = RestService.For<IPaperlessNgxApi>("http://api.paperlessngx.com");

            using (var pdfDocument = File.OpenRead("path/to/document.pdf"))
            {
                var newDocument = await paperlessNgxApi.CreateDocument(pdfDocument, "My PDF Document");
            }
        }
    }
}

```
