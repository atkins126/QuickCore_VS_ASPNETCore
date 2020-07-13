unit MathService;

interface

uses
  Quick.Core.Logging.Abstractions,
  Abstractions.IMathService;

type
  TMathService = class(TInterfacedObject, IMathService)
    private
      flogger : ILogger;
    public
      constructor Create(Logger : ILogger);
      function GenerateComplexMath(n, m : Integer) : Integer;
  end;

implementation

{ TMathService }

constructor TMathService.Create(Logger: ILogger);
begin
  flogger := Logger;
end;

function TMathService.GenerateComplexMath(n, m : Integer) : Integer;
var
  t,ii: double;
  i, j: integer;
  d, r: double;
begin
  t:= 0.0;
  for j:= 1 to n do
  begin
    t:= t / 1000.0;
    ii:= 1.0;
    for i:= 1 to m do
    begin
      t:= t + ii / 999999.0;
      d:= t * t + ii;
      ii:= ii + 1.0;
      r:= (t + d) / (200000.0 * ii);
      t:= t - r;
    end;
  end;
  Result := t;
end;

end.
