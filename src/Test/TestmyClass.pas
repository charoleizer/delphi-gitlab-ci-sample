unit TestmyClass;

interface

uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TMyTestObject = class(TObject)
  public
    [Test]
    procedure ShowSuccessfullMessage;
  end;

implementation

uses
  myClass;



procedure TMyTestObject.ShowSuccessfullMessage;
begin
  Assert.IsTrue(TMyClass.ShowSuccessfullMessage = 'Hello from awesome stack - Gitlab-CI and Dockered-Delphi compilation');
end;

initialization

TDUnitX.RegisterTestFixture(TMyTestObject);

end.
