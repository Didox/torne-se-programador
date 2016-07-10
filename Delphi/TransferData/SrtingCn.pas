unit SrtingCn;

interface

type
  StringCn = class
  private
    { Private Declarations }
  public
    function getStrCn : string;
    constructor Create;
  end;

implementation

constructor StringCn.Create;
begin
  inherited Create;
  // TODO: Add any constructor code here
end;

function StringCn.getStrCn : string;
begin
  Result := 'Persist Security Info=True;User' +
  ' ID=sa;Initial Catalog=bancoTeste;Data Source=.';
end;

end.
