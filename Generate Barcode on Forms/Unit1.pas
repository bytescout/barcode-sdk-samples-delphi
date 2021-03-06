//*******************************************************************
//       ByteScout BarCode SDK		                                     
//                                                                   
//       Copyright © 2020 ByteScout - http://www.bytescout.com       
//       ALL RIGHTS RESERVED                                         
//                                                                   
//*******************************************************************

unit Unit1;

{
 IMPORTANT NOTICE for DELPHI 2007, Delphi 2006 or earlier versions:
 -----------------------------------------------------------------------
 Usual approach with type library import (so called "early binding") will crash with "stackoverflow" or "floating point error" due to issues in this versions of Delphi. 
 SOLUTION: Please use so called "late binding" that requires NO type library import and works by creating objects at the runtime like this:  
 // -----------------
 program Project1;
 uses
   SysUtils,
   ComObj,
   ActiveX;
 var
 extractor: Variant;
 begin
 CoInitialize(nil);
 // Create and initialize 
 extractor := CreateOleObject('Bytescout.PDFExtractor.CSVExtractor') ;
 // as usual 
 extractor.LoadDocumentFromFile ('../../sample3.pdf');
 // …
 // destroy the object by setting to varEmpty
 extractor := varEmpty;  
 end.
 // -----------------  

 IMPORTANT:
  To work with Bytescout BarCode SDK you need to import this as a component into Delphi

 To import Bytescout BarCode SDK into Delphi 5 or higher to the following:
 1) Click Component | Import ActiveX control
 2) Find and select Bytescout BarCode SDK in the list of available type libraries and
 4) Click Next
 5) Select "Add Bytescout_BarCode_TLB.pas" into Project" and click Finish


 To import Bytescout BarCode SDK into Delphi 2006 or higher do the following:
 1) Click Component | Import Component..
 2) Select Type Library and click Next
 3) Find and select Bytescout BarCode SDK in the list of available type libraries and
 4) Click Next
 5) Click Next on next screen
 6) Select "Add Bytescout_BarCode_TLB.pas" into Project" and click Finish

 This will add Bytescout_BarCode_TLB.pas into your project and now you can use BarCode object interface (_BarCode class)

}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  ActiveX, // required for ActiveX support
  Bytescout_BarCode_TLB;


procedure TForm1.Button1Click(Sender: TObject);
var
 bc: _Barcode;
begin



//  CoInitialize(nil);  // required for console applications, initializes ActiveX support

  // create barcode object using CoBarCode class
  bc:= CoBarCode.Create();
  // set symbology to Code39
  bc.Symbology := SymbologyType_Code39;
  // set barcode value
  bc.Value:= '12345';
  // save into PNG image
  bc.SaveImage('Code39.png');
  // free barcode object by setting to nil
  bc:= nil;

//  CoUninitialize(); // required for console applications, initializes ActiveX support
end;

end.
