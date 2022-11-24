program form2pas;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  DS.DfmParser,
  System.SysUtils;

var
  DfmFile: TDfmFile;

begin

  try
  if ParamCount<2 then
      begin
         Writeln('usage:form2pas [form filename(.dfm/.lfm)] [.pas filename]');
         exit;
      end;

    DfmFile := TDfmFile.Create;
    DfmFile.LoadFromFile(ParamStr(1));

    DfmFile.SaveToPas(ParamStr(2));
    DfmFile.Free;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);

  end;

end.
