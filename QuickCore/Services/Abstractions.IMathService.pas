unit Abstractions.IMathService;

interface

uses
  System.Generics.Collections;

type
  IMathService = interface['{3AF20DEE-B50D-4431-851B-52740B00A81B}']
    function GenerateComplexMath(n, m : Integer) : Double;
    function TestArrays : TList<string>;
  end;

implementation

end.
