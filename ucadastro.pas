unit ucadastro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls;

type

  { TfrmCadastro }

  TfrmCadastro = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

uses Unit1;

{$R *.lfm}

{ TfrmCadastro }

procedure TfrmCadastro.Button1Click(Sender: TObject);
begin
  form1.qryDados.Post;
  close;
end;

procedure TfrmCadastro.Button2Click(Sender: TObject);
begin
  form1.qryDados.Cancel;
  close;
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
  if DBEdit2.CanFocus then
    dbedit2.SetFocus;
end;

end.

