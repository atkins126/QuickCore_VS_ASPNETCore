using System;
using System.Collections.Generic;
using System.Text;

namespace DotNetCore.Application.Services
{
    public interface IMathService
    {
        double GenerateComplexMath(int n, int m);
        IEnumerable<string> TestArrays();
    }
}
