unit CLMedia;

interface
uses Classes;
type
        TMedia = class
        protected
                FValor1 : real;
                FValor2 : real;
                procedure SetVal1(valor : real);
                procedure SetVal2(valor : real);
        public
                constructor Create;
                function CalcularMedia : real; virtual;
                property Valor1 : real read FValor1 write SetVal1;
                property Valor2 : real read FValor2 write SetVal2;
        end;
implementation
{ TMedia }
function TMedia.CalcularMedia: real;
begin
        Result := (Valor1 + Valor2) / 2;
end;
constructor TMedia.Create;
begin
        FValor1 := 0;
        FValor2 := 0;
end;
procedure TMedia.SetVal1(valor: real);
begin
        if valor > 0 then FValor1 := valor
        else FValor1 := 0;
end;
procedure TMedia.SetVal2(valor: real);
begin
        if valor > 0 then FValor2 := valor
        else FValor2 := 0;
end;

end.
