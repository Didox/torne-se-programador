unit IType;
interface
uses Classes;
type
  ITypes = Interface
    procedure Save;
    procedure Delete;
    function Get : TList;
    function GetFull : Boolean;
    procedure SetFull(isFull : Boolean);
    property IsFull   : Boolean read GetFull write SetFull;
  end;
implementation
end.

