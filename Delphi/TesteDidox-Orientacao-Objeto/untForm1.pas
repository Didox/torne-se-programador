unit untForm1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CLMedia, Cliente;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
        i : Integer;
        //Media : TMedia;
        Cliente : TCliente;
begin
        Cliente := TCliente.Create(1, 'teste');
        Cliente.Save();

 //       Media := TMedia.Create();
//        Media.Valor1

        Edit1.Text := 'teste';
        ShowMessage(Edit1.Text);

        for i:=0 to 10 do
        begin
                Edit1.Text := Edit1.Text + ' - ' + IntToStr(i);
        end;
end;

end.
