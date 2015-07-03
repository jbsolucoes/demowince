unit udm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, FileUtil;

type

  { Tdm }

  Tdm = class(TDataModule)
    dbConn: TSQLite3Connection;
    trGeral: TSQLTransaction;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.lfm}

{ Tdm }

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
  dbConn.DatabaseName := extractfilepath(paramstr(0)) + 'demo.db';

  try
    dbConn.Open;
  except on e:exception do
    raise exception.create(format('Erro ao abrir %s! %s', [dbConn.DatabaseName, e.message]));
  end;
end;

procedure Tdm.DataModuleDestroy(Sender: TObject);
begin
  dbConn.Close();
end;

end.

