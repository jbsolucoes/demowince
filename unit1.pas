unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, FileUtil, Forms, Controls, Graphics, Dialogs,
  DBGrids, StdCtrls, ucadastro, udm;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    dsDados: TDataSource;
    gridDados: TDBGrid;
    qryDados: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryDadosAfterPost(DataSet: TDataSet);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button4Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  qrydados.open;
end;

procedure TForm1.qryDadosAfterPost(DataSet: TDataSet);
begin
  qrydados.ApplyUpdates;

  qrydados.close;
  qrydados.open;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  qryDados.append;
  qryDados.fieldbyname('id').value := qryDados.recordcount +1;

  application.createform(tfrmcadastro, frmcadastro);

  try
    frmcadastro.ShowModal;

  finally
    frmcadastro.free;
    frmcadastro := nil;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  qryDados.edit;

  application.createform(tfrmcadastro, frmcadastro);

  try
    frmcadastro.ShowModal;

  finally
    frmcadastro.free;
    frmcadastro := nil;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  qryDados.Delete;
end;

end.

