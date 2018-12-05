# Visual Studio 

## Find and Replace with Regex
Im Visual Studio kann mit REGEX gesucht und/oder ersetzt werden.
Wenn man "Ctrl + H" drückt, erscheint das Feld zum suchen und ersetzen.
 
In diesem Feld kann man Links unten, neben dem Auswahlbereich das Flag "Use regular expression (Hotkey: Alt + E)" auswählen.
 
Regex im Visual Studio hat ein paar Grundbegriffe:
### Suchen:
Wert | Beschreibung
---  | ---
`.` (Punkt)     | markiert das nächste Zeichen
`(.*)`          | markiert bis zum Ende des Satzes alle Zeichen
`(.*)TEXT`      | markiert bis zum letzten vorkommen des Wortes "TEXT" alle Zeichen. Bsp: Hallo TEXT, du bist ein TEXT-Test!
`(.*?)`         | markiert bis zum Ende des Satzes alle Zeichen
`(.*?)TEXT`     | markiert bis zum ersten vorkommen des Wortes "TEXT" alle Zeichen. Bsp: Hallo TEXT, du bist ein TEXT-Test!
`\(` oder `\)`  | markiert eine normale Klammer. Klammern sind Spezialzeichen im Regex, die für die Markierung verwendet werden und müssen daher speziell mit \ angeführt werden, um nicht als REGEX-Ausdruck zu gelten.
### Ersetzen:
Wert | Beschreibung
---  | ---
`$1` bis `$x`   | markierte bereiche (mit .* oder .*?), wobei der index bei 1 beginnt.
`\n`            | fügt einen Zeilenumbruch ein.
 
Zwei praxis-Beispiele für die Anwendung von Regex:
#### Beispiel 1: 
in einem switch-Case sollen die fix eingetragenen Werte mithilfe einer MetadataHelper-Klasse ausgelesen werden. Dadurch ist die Fehleranfälligkeit beim ändern der Werte oder der Namen behoben:
```csharp
switch (table)
{
    case UpdateTables.FactItemMaster:
        return "FactItemMaster";
    case UpdateTables.FactOffer:
        return "FactOffer";
    case UpdateTables.FactOfferDevice:
        return "FactOfferDevice";
    case UpdateTables.FactOpportunity:
        return "FactOpportunity";
    case UpdateTables.FactOrderBook:
        return "FactOrderBook";
    case UpdateTables.FactOrderIncoming:
        return "FactOrderIncoming";
    case UpdateTables.FactOrderTurnover:
        return "FactOrderTurnover";
    case UpdateTables.FactProductionVolume:
        return "FactProductionVolume";
    case UpdateTables.FactSpecialDirectCosts:
        return "FactSpecialDirectCosts";
    case UpdateTables.OrderCalculation:
        return "OrderCalculation";
    case UpdateTables.OrderCalculationTeamSelling:
        return "OrderCalculationTeamSelling";
    case UpdateTables.OrderPositionCalculation:
        return "OrderPositionCalculation";
    default:
        throw new ArgumentOutOfRangeException(nameof(table), table, null);
}
```
 
Dieser Code soll zu folgendem Code umgeschrieben werden:
```csharp
switch (table)
{
    case UpdateTables.FactItemMaster:
        return MetadataHelper.GetTableName(typeof(DwhFactItemMaster), context);
    case UpdateTables.FactOffer:
        return MetadataHelper.GetTableName(typeof(DwhFactOffer), context);
    case UpdateTables.FactOfferDevice:
        return MetadataHelper.GetTableName(typeof(DwhFactOfferDevice), context);
    case UpdateTables.FactOpportunity:
        return MetadataHelper.GetTableName(typeof(DwhFactOpportunity), context);
    case UpdateTables.FactOrderBook:
        return MetadataHelper.GetTableName(typeof(DwhFactOrderBook), context);
    case UpdateTables.FactOrderIncoming:
        return MetadataHelper.GetTableName(typeof(DwhFactOrderIncoming), context);
    case UpdateTables.FactOrderTurnover:
        return MetadataHelper.GetTableName(typeof(DwhFactOrderTurnover), context);
    case UpdateTables.FactProductionVolume:
        return MetadataHelper.GetTableName(typeof(DwhFactProductionVolume), context);
    case UpdateTables.FactSpecialDirectCosts:
        return MetadataHelper.GetTableName(typeof(DwhFactSpecialDirectCosts), context);
    case UpdateTables.OrderCalculation:
        return MetadataHelper.GetTableName(typeof(DwhOrderCalculation), context);
    case UpdateTables.OrderCalculationTeamSelling:
        return MetadataHelper.GetTableName(typeof(DwhOrderCalculationTeamSelling), context);
    case UpdateTables.OrderPositionCalculation:
        return MetadataHelper.GetTableName(typeof(DwhOrderPositionCalculation), context);
    default:
        throw new ArgumentOutOfRangeException(nameof(table), table, null);
}
```
 
Verwendetes Regex dafür:
Suchen: `return "(.*?)";`
Ersetzen: `return MetadataHelper.GetTableName(typeof(Dwh$1), context);`
In diesem Regex wird der Text zwischen den beiden Klammern ausgewählt und im ersetzen-Teil mit dem Präfix 'Dwh' in die typeof-Methode geschrieben, die widerum in der GetTableName-Methode übergeben wird
 
#### Beispiel 2: 
In einem ASPx-Grid sollen mehrere Spalten einen Hyperlink im Datatemplate erhalten, der aus Fieldname + 'Link' besteht:
```csharp
<dx:GridViewDataTextColumn Caption="Produced" FieldName="Produced" VisibleIndex="4" />
<dx:GridViewDataTextColumn Caption="Production planned" FieldName="ProductionPlanned" VisibleIndex="5" />
<dx:GridViewDataTextColumn Caption="Total production" FieldName="ProductionTotal" VisibleIndex="6" />
<dx:GridViewDataTextColumn Caption="Delivered" FieldName="DeliveredLink" VisibleIndex="7" />
<dx:GridViewDataTextColumn Caption="Deliveries planned" FieldName="DeliveryPlanned" VisibleIndex="8" />
<dx:GridViewDataTextColumn Caption="Total deliveries" FieldName="DeliveriesTotal" VisibleIndex="9" />
<dx:GridViewDataTextColumn Caption="Current stock (finance)" FieldName="CurrentStockFinance" VisibleIndex="10" />
<dx:GridViewDataTextColumn Caption="Current stock (incl.)" FieldName="CurrentStockIncl" ToolTip="incl. customer devices" VisibleIndex="11" />
<dx:GridViewDataTextColumn Caption="Current stock (excl.)" FieldName="CurrentStockExcl" ToolTip="excl. customer devices" VisibleIndex="12" />
<dx:GridViewDataTextColumn Caption="Stock end of period" FieldName="StockEndOfPeriod" VisibleIndex="13" />
 
Dieser Code soll zu folgendem Code umgeschrieben werden:
<dx:GridViewDataTextColumn Caption="Produced" FieldName="ProducedLink" VisibleIndex="4">
    <DataItemTemplate>
        <a href="javascript:ShowDetail('<%# Eval("ProducedLink") %>')"><%# Convert.ToInt32(Eval("Produced")) == 0 ? string.Empty : Eval("Produced") %>
        </a>
    </DataItemTemplate>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn Caption="Production planned" FieldName="ProductionPlannedLink" VisibleIndex="5">
    <DataItemTemplate>
        <a href="javascript:ShowDetail('<%# Eval("ProductionPlannedLink") %>')"><%# Convert.ToInt32(Eval("ProductionPlanned")) == 0 ? string.Empty : Eval("ProductionPlanned") %>
        </a>
    </DataItemTemplate>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn Caption="Total production" FieldName="ProductionTotalLink" VisibleIndex="6">
    <DataItemTemplate>
        <a href="javascript:ShowDetail('<%# Eval("ProductionTotalLink") %>')"><%# Convert.ToInt32(Eval("ProductionTotal")) == 0 ? string.Empty : Eval("ProductionTotal") %>
        </a>
    </DataItemTemplate>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn Caption="Delivered" FieldName="DeliveredLinkLink" VisibleIndex="7">
    <DataItemTemplate>
        <a href="javascript:ShowDetail('<%# Eval("DeliveredLinkLink") %>')"><%# Convert.ToInt32(Eval("DeliveredLink")) == 0 ? string.Empty : Eval("DeliveredLink") %>
        </a>
    </DataItemTemplate>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn Caption="Deliveries planned" FieldName="DeliveryPlannedLink" VisibleIndex="8">
    <DataItemTemplate>
        <a href="javascript:ShowDetail('<%# Eval("DeliveryPlannedLink") %>')"><%# Convert.ToInt32(Eval("DeliveryPlanned")) == 0 ? string.Empty : Eval("DeliveryPlanned") %>
        </a>
    </DataItemTemplate>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn Caption="Total deliveries" FieldName="DeliveriesTotalLink" VisibleIndex="9">
    <DataItemTemplate>
        <a href="javascript:ShowDetail('<%# Eval("DeliveriesTotalLink") %>')"><%# Convert.ToInt32(Eval("DeliveriesTotal")) == 0 ? string.Empty : Eval("DeliveriesTotal") %>
        </a>
    </DataItemTemplate>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn Caption="Current stock (finance)" FieldName="CurrentStockFinanceLink" VisibleIndex="10">
    <DataItemTemplate>
        <a href="javascript:ShowDetail('<%# Eval("CurrentStockFinanceLink") %>')"><%# Convert.ToInt32(Eval("CurrentStockFinance")) == 0 ? string.Empty : Eval("CurrentStockFinance") %>
        </a>
    </DataItemTemplate>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn Caption="Current stock (incl.)" FieldName="CurrentStockInclLink" ToolTip="incl. customer devices" VisibleIndex="11">
    <DataItemTemplate>
        <a href="javascript:ShowDetail('<%# Eval("CurrentStockInclLink") %>')"><%# Convert.ToInt32(Eval("CurrentStockIncl")) == 0 ? string.Empty : Eval("CurrentStockIncl") %>
        </a>
    </DataItemTemplate>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn Caption="Current stock (excl.)" FieldName="CurrentStockExclLink" ToolTip="excl. customer devices" VisibleIndex="12">
    <DataItemTemplate>
        <a href="javascript:ShowDetail('<%# Eval("CurrentStockExclLink") %>')"><%# Convert.ToInt32(Eval("CurrentStockExcl")) == 0 ? string.Empty : Eval("CurrentStockExcl") %>
        </a>
    </DataItemTemplate>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn Caption="Stock end of period" FieldName="StockEndOfPeriodLink" VisibleIndex="13">
    <DataItemTemplate>
        <a href="javascript:ShowDetail('<%# Eval("StockEndOfPeriodLink") %>')"><%# Convert.ToInt32(Eval("StockEndOfPeriod")) == 0 ? string.Empty : Eval("StockEndOfPeriod") %>
        </a>
    </DataItemTemplate>
</dx:GridViewDataTextColumn>
```

Verwendetes Regex dafür:
Suchen: `<dx:(.*?)FieldName="(.*?)"(.*)/>`
Ersetzen: `<dx:$1FieldName="$2Link"$3>\n<DataItemTemplate>\n<a href="javascript:ShowDetail('<%# Eval("$2Link") %>')"><%# Convert.ToInt32(Eval("$2")) == 0 ? string.Empty : Eval("$2") %>\n</a>\n</DataItemTemplate>\n</dx:GridViewDataTextColumn>`
In diesem Regex werden drei Werte aus dem ursprünglichen Text ausgewählt: Der Text bis zum Fieldname, der gleich bleiben soll, der Wert des Fieldname und der Rest hinter dem Fieldname. Beim ersetzen wird der Fieldname (bsp: Produced) ersetzt durch den Fieldname mit 'Link' (bsp: ProducedLink), sowie der gesamte DataItemTemplate (inklusive Zeilenumbrüchen) geschrieben.
 
Tipp für das verwenden von Regex im Visual Studio: Eine einzelne Zeile markieren, bei der Suchen+Ersetzen auswahl auf "Selection" einschränken und an dieser Zeile das Regex ausprobieren, bevor der rest markiert und ersetzt wird.
Bei größeren ersetzungsroutinen, wie im Beispiel 2 gezeigt, lohnt es sich die Zeilen selber zu schreiben und dann den betreffenden Wert in einem Editor der Wahl durch den $x-Ausdruck zu ersetzen.


## Project Type Guids

| Name                                           | Guid                                   |
| ---------------------------------------------- | -------------------------------------- |
| ASP.NET 5                                      | {8BB2217D-0F2D-49D1-97BC-3654ED321F3B} |
| ASP.NET MVC 1                                  | {603C0E0B-DB56-11DC-BE95-000D561079B0} |
| ASP.NET MVC 2                                  | {F85E285D-A4E0-4152-9332-AB1D724D3325} |
| ASP.NET MVC 3                                  | {E53F8FEA-EAE0-44A6-8774-FFD645390401} |
| ASP.NET MVC 4                                  | {E3E379DF-F4C6-4180-9B81-6769533ABE47} |
| ASP.NET MVC 5                                  | {349C5851-65DF-11DA-9384-00065B846F21} |
| C#                                             | {FAE04EC0-301F-11D3-BF4B-00C04F79EFBC} |
| C++                                            | {8BC9CEB8-8B4A-11D0-8D11-00A0C91BC942} |
| Database                                       | {A9ACE9BB-CECE-4E62-9AA4-C7E7C5BD2124} |
| Database (other project types)                 | {4F174C21-8C12-11D0-8340-0000F80270F8} |
| Deployment Cab                                 | {3EA9E505-35AC-4774-B492-AD1749C4943A} |
| Deployment Merge Module                        | {06A35CCD-C46D-44D5-987B-CF40FF872267} |
| Deployment Setup                               | {978C614F-708E-4E1A-B201-565925725DBA} |
| Deployment Smart Device Cab                    | {AB322303-2255-48EF-A496-5904EB18DA55} |
| Distributed System                             | {F135691A-BF7E-435D-8960-F99683D2D49C} |
| Dynamics 2012 AX C# in AOT                     | {BF6F8E12-879D-49E7-ADF0-5503146B24B8} |
| F#                                             | {F2A71F9B-5D33-465A-A702-920D77279786} |
| J#                                             | {E6FDF86B-F3D1-11D4-8576-0002A516ECE8} |
| Legacy (2003) Smart Device (C#)                | {20D4826A-C6FA-45DB-90F4-C717570B9F32} |
| Legacy (2003) Smart Device (VB.NET)            | {CB4CE8C6-1BDB-4DC7-A4D3-65A1999772F8} |
| Micro Framework                                | {b69e3092-b931-443c-abe7-7e7b65f2a37f} |
| Model-View-Controller v2 (MVC 2)               | {F85E285D-A4E0-4152-9332-AB1D724D3325} |
| Model-View-Controller v3 (MVC 3)               | {E53F8FEA-EAE0-44A6-8774-FFD645390401} |
| Model-View-Controller v4 (MVC 4)               | {E3E379DF-F4C6-4180-9B81-6769533ABE47} |
| Model-View-Controller v5 (MVC 5)               | {349C5851-65DF-11DA-9384-00065B846F21} |
| Mono for Android                               | {EFBA0AD7-5A72-4C68-AF49-83D382785DCF} |
| MonoTouch                                      | {6BC8ED88-2882-458C-8E55-DFD12B67127B} |
| MonoTouch Binding                              | {F5B4F3BC-B597-4E2B-B552-EF5D8A32436F} |
| Portable Class Library                         | {786C830F-07A1-408B-BD7F-6EE04809D6DB} |
| Project Folders                                | {66A26720-8FB5-11D2-AA7E-00C04F688DDE} |
| SharePoint (C#)                                | {593B0543-81F6-4436-BA1E-4747859CAAE2} |
| SharePoint (VB.NET)                            | {EC05E597-79D4-47f3-ADA0-324C4F7C7484} |
| SharePoint Workflow                            | {F8810EC1-6754-47FC-A15F-DFABD2E3FA90} |
| Silverlight                                    | {A1591282-1198-4647-A2B1-27E5FF5F6F3B} |
| Smart Device (C#)                              | {4D628B5B-2FBC-4AA6-8C16-197242AEB884} |
| Smart Device (VB.NET)                          | {68B1623D-7FB9-47D8-8664-7ECEA3297D4F} |
| Solution Folder                                | {2150E333-8FDC-42A3-9474-1A3956D46DE8} |
| Test                                           | {3AC096D0-A1C2-E12C-1390-A8335801FDAB} |
| Universal Windows Class Library                | {A5A43C5B-DE2A-4C0C-9213-0A381AF9435A} |
| VB.NET                                         | {F184B08F-C81C-45F6-A57F-5ABD9991F28F} |
| Visual Database Tools                          | {C252FEB5-A946-4202-B1D4-9916A0590387} |
| Visual Studio 2015 Installer Project Extension | {54435603-DBB4-11D2-8724-00A0C9A8B90C} |
| Visual Studio Tools for Applications (VSTA)    | {A860303F-1F3F-4691-B57E-529FC101A107} |
| Visual Studio Tools for Office (VSTO)          | {BAA0C2D2-18E2-41B9-852F-F413020CAA33} |
| Web Application                                | {349C5851-65DF-11DA-9384-00065B846F21} |
| Web Site                                       | {E24C65DC-7377-472B-9ABA-BC803B73C61A} |
| Windows (C#)                                   | {FAE04EC0-301F-11D3-BF4B-00C04F79EFBC} |
| Windows (VB.NET)                               | {F184B08F-C81C-45F6-A57F-5ABD9991F28F} |
| Windows (Visual C++)                           | {8BC9CEB8-8B4A-11D0-8D11-00A0C91BC942} |
| Windows Communication Foundation (WCF)         | {3D9AD99F-2412-4246-B90B-4EAA41C64699} |
| Windows Phone 8/8.1 Blank/Hub/Webview App      | {76F1466A-8B6D-4E39-A767-685A06062A39} |
| Windows Phone 8/8.1 App (C#)                   | {C089C8C0-30E0-4E22-80C0-CE093F111A43} |
| Windows Phone 8/8.1 App (VB.NET)               | {DB03555F-0C8B-43BE-9FF9-57896B3C5E56} |
| Windows Presentation Foundation (WPF)          | {60DC8134-EBA5-43B8-BCC9-BB4BC16C2548} |
| Windows Store (Metro) Apps & Components        | {BC8A1FFA-BEE3-4634-8014-F334798102B3} |
| Workflow (C#)                                  | {14822709-B5A1-4724-98CA-57A101D1B079} |
| Workflow (VB.NET)                              | {D59BE175-2ED0-4C54-BE3D-CDAA9F3214C8} |
| Workflow Foundation                            | {32F31D43-81CC-4C15-9DE6-3FC5453562B6} |
| Xamarin.Android                                | {EFBA0AD7-5A72-4C68-AF49-83D382785DCF} |
| Xamarin.iOS                                    | {6BC8ED88-2882-458C-8E55-DFD12B67127B} |
| XNA (Windows)                                  | {6D335F3A-9D43-41b4-9D22-F6F17C4BE596} |
| XNA (XBox)                                     | {2DF5C3F4-5A5F-47a9-8E94-23B4456F55E2} |
| XNA (Zune)                                     | {D399B71A-8929-442a-A9AC-8BEC78BB2433} |

[Source](https://www.codeproject.com/Reference/720512/List-of-Visual-Studio-Project-Type-GUIDs)


### Build Actions on Files
* **None:** The file is not included in the project output group and is not compiled in the build process. An example is a text file that contains documentation, such as a Readme file.
* **Compile:** The file is compiled into the build output. This setting is used for code files.
* **Content:** Allows you to retrieve a file (in the same directory as the assembly) as a stream via Application.GetContentStream(URI). For this method to work, it needs a AssemblyAssociatedContentFile custom attribute which Visual Studio graciously adds when you mark a file as "Content"
* **Embedded resource:** Embeds the file in an exclusive assembly manifest resource.
* **Resource (WPF only):** Embeds the file in a shared (by all files in the assembly with similar setting) assembly manifest resource named AppName.g.resources.
* **Page (WPF only):** Used to compile a xaml file into baml. The baml is then embedded with the same technique as Resource (i.e. available as `AppName.g.resources)
* **ApplicationDefinition (WPF only):** Mark the XAML/class file that defines your application. You specify the code-behind with the x:Class="Namespace.ClassName" and set the startup form/page with StartupUri="Window1.xaml"
* **SplashScreen (WPF only):** An image that is marked as SplashScreen is shown automatically when an WPF application loads, and then fades
* **DesignData:** Compiles XAML viewmodels so that usercontrols can be previewed with sample data in Visual Studio (uses mock types)
* **DesignDataWithDesignTimeCreatableTypes:** Compiles XAML viewmodels so that usercontrols can be previewed with sample data in Visual Studio (uses actual types)
* **EntityDeploy: (Entity Framework):** used to deploy the Entity Framework artifacts
* **CodeAnalysisDictionary:** An XML file containing custom word dictionary for spelling rules
	
	[Source](https://stackoverflow.com/questions/145752/what-are-the-various-build-action-settings-in-visual-studio-project-properties)


### Nuget Teinstall
`Update-Package -reinstall`
