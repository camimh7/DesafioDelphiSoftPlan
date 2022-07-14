unit uspComponentesRegistro;

interface

uses
  Classes,uspQuery;

  type
     TspComponentesRegistro = class(TComponent)
       private
       protected
       public
     end;

procedure Register;


implementation

procedure Register;
begin
  RegisterComponents('spComponents',[TspQuery])
end;

end.
