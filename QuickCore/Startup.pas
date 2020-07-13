unit Startup;

interface

uses
  Impl.MathService,
  Abstractions.IMathService,
  Quick.Core.Mvc,
  Quick.Core.DependencyInjection,
  Quick.Core.Entity.Config,
  Quick.Core.Logging,
  Controllers.HomeController;

type
  TStartup = class(TStartupMvc)
  public
    class procedure ConfigureServices(services : TServiceCollection); override;
    class procedure Configure(app : TMVCServer); override;
  end;

implementation

class procedure TStartup.ConfigureServices(services : TServiceCollection);
begin
  services
   .AddLogging(TLoggerBuilder.GetBuilder
        .AddConsole(procedure(aOptions : TConsoleLoggerOptions)
            begin
              aOptions.LogLevel := LOG_DEBUG;
              aOptions.ShowEventColors := True;
              aOptions.ShowTimeStamp := True;
              aOptions.ShowEventType := False;
              aOptions.Enabled := True;
            end)
        .Build);
   //.AddDebugger;

  services
    .AddTransient<IMathService,TMathService>;
end;

class procedure TStartup.Configure(app : TMVCServer);
begin
  app
  .AddControllers
  //.AddController(THomeController)
  .DefaultRoute(THomeController,'Home/Index')
  .UseWebRoot('.\wwwroot')
  .UseRouting
  .UseMVC;
end;

end.
