unit myClass;

interface

type
  TMyClass = class
    class function ShowSuccessfullMessage: String;
  end;

implementation

{ MyClass }



class function TMyClass.ShowSuccessfullMessage: String;
begin
  Result := 'Hello from awesome stack - Gitlab-CI and Dockered-Delphi compilation';
end;

end.
