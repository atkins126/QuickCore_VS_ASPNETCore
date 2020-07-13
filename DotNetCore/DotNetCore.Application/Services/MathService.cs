using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace DotNetCore.Application.Services
{
    public class MathService : IMathService
    {
        public double GenerateComplexMath(int n, int m)
        {
            double t;
            int i, j;
            double d, r, ii;
            t = 0.0;
            for (j = 1; j <= n; j++)
            {
                t = t / 1000.0;
                ii = 1.0;
                for (i = 1; i <= m; i++)
                {
                    t = t + ii / 999999.0;
                    d = t * t + ii;
                    ii = ii + 1.0;
                    r = (t + d) / (200000.0 * ii);
                    t = t - r;
                }        
            }
            return t;
        }

        public IEnumerable<string> TestArrays()
        {
            List<string> al = new List<string>();
            for (int i = 0; i < 50000; i++)
                al.Add("hello");
            return al;            
        }
    }
}
