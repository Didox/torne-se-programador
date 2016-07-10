unit Cliente;

interface
uses Classes, IType;
type
        TCliente = Class(TInterfacedObject, ITypes)
        protected
                _isFull : Boolean;
                _cod : Integer;
                _name : string;

               function GetFull : Boolean;
               procedure SetFull(isFull : Boolean);
        private
        public
                constructor Create; overload;
                constructor Create(cod_ : Integer; name_ : string); overload;

                property IsFull : Boolean read GetFull write SetFull;
                property Cod : Integer read _cod write _cod;
                property Name : string read _name write _name;

                procedure Save;
                procedure Delete;
                function  Get : TList;
        end;


implementation

constructor TCliente.Create;
begin
end;

constructor TCliente.Create(cod_ : Integer; name_ : String);
begin
        self._cod := cod_;
        self._name := name_;
end;

procedure TCliente.Save;
begin
        // salvar
end;

function TCliente.GetFull;
begin
    Result := _isFull;
end;

procedure TCliente.SetFull(isFull : Boolean);
begin
    self._isFull := isFull;
end;

procedure TCLiente.Delete;
begin

end;

function TCliente.Get;
var
        List : TList;
        objCliente : TCliente;
Begin
        objCliente := TCliente.Create;

        List := TList.Create;
        List.Add(objCliente);

        Result := List;
end;
end.
