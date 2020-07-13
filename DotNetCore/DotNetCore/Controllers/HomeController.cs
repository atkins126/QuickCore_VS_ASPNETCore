using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DotNetCore.Application.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace DotNetCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IMathService _mathService;

        public HomeController(ILogger<HomeController> logger, IMathService mathService)
        {
            _logger = logger;
            _mathService = mathService;
        }

        public IActionResult Index()
        {
            //return Ok(_mathService.GenerateComplexMath(1, 999999999).ToString());
            return Ok(JsonConvert.SerializeObject(_mathService.TestArrays()));
        }
    }
}
