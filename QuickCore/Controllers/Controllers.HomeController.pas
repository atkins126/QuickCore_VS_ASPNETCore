unit Controllers.HomeController;

interface

uses
  Abstractions.IMathService,
  System.SysUtils,
  Quick.Json.Serializer,
  Quick.HttpServer.Types,
  Quick.Core.Mvc.Controller,
  Quick.Core.Mvc.ActionResult,
  Quick.Commons;

type
  THomeController = class(THttpController)
  private
    fmathservice : IMathService;
  public
    constructor Create(MathService : IMathService);
  published
    [HttpGet('Home'),ActionName('Index')]
    function Index : IActionResult;
  end;

implementation

{ THomeController }

constructor THomeController.Create(MathService: IMathService);
begin
  fmathservice := MathService;
end;

function THomeController.Index: IActionResult;
begin
  var arra := fmathservice.TestArrays;
  Result := TJsonResult.Create(arra);
  arra.Free;
end;

initialization
  RegisterController(THomeController);

end.
