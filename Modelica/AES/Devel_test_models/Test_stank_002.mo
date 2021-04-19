within AES.Devel_test_models;

model Test_stank_002
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.surfTcond_fixed surfTcond(T = 283.15) annotation(
    Placement(visible = true, transformation(origin = {62, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.TubeStream tube(dz = 2.5, n = 5) annotation(
    Placement(visible = true, transformation(origin = {62, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression pi(y = if time < 5000 then 0.5 else 0.01) annotation(
    Placement(visible = true, transformation(origin = {-110, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression x(y = 273.15 + 50) annotation(
    Placement(visible = true, transformation(origin = {-176, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.StratifiedTank_2zones stank annotation(
    Placement(visible = true, transformation(origin = {-10, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.Pressuriser psrc annotation(
    Placement(visible = true, transformation(origin = {-72, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ProcessComponents.Thermal.Piping_liquid.Pump_centrifugal pumpsrc annotation(
    Placement(visible = true, transformation(origin = {-88, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.HVAC.ControlledLiquidHeater H annotation(
    Placement(visible = true, transformation(origin = {-124, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.Tube tubesrc annotation(
    Placement(visible = true, transformation(origin = {-52, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression Hon(y = true) annotation(
    Placement(visible = true, transformation(origin = {-160, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.Pump_centrifugal pump_centrifugal(dp0 = 250000) annotation(
    Placement(visible = true, transformation(origin = {24, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(surfTcond.surf, tube.surf) annotation(
    Line(points = {{62, 21.3333}, {62, -5.66664}}, color = {144, 5, 5}));
  connect(H.pwh_b, pumpsrc.pwh_a) annotation(
    Line(points = {{-112, -10}, {-100, -10}}, color = {46, 52, 54}));
  connect(tube.pwh_b, stank.coldIn) annotation(
    Line(points = {{74, -10}, {98, -10}, {98, -22}, {2, -22}}, color = {46, 52, 54}));
  connect(x.y, H.To) annotation(
    Line(points = {{-165, 2}, {-147, 2}, {-147, -5}, {-135, -5}}, color = {0, 0, 127}));
  connect(H.ON, Hon.y) annotation(
    Line(points = {{-134, -2}, {-140, -2}, {-140, 46}, {-148, 46}}, color = {255, 0, 255}));
  connect(pi.y, pumpsrc.cmd) annotation(
    Line(points = {{-98, 26}, {-88, 26}, {-88, -2}}, color = {0, 0, 127}));
  connect(stank.hotOut, pump_centrifugal.pwh_a) annotation(
    Line(points = {{2, -10}, {12, -10}}, color = {46, 52, 54}));
  connect(pump_centrifugal.pwh_b, tube.pwh_a) annotation(
    Line(points = {{36, -10}, {50, -10}}, color = {46, 52, 54}));
  connect(pi.y, pump_centrifugal.cmd) annotation(
    Line(points = {{-98, 26}, {24, 26}, {24, -2}}, color = {0, 0, 127}));
  connect(pumpsrc.pwh_b, tubesrc.pwh_a) annotation(
    Line(points = {{-76, -10}, {-64, -10}}, color = {46, 52, 54}));
  connect(tubesrc.pwh_b, stank.hotIn) annotation(
    Line(points = {{-40, -10}, {-22, -10}}, color = {46, 52, 54}));
  connect(stank.coldOut, psrc.pwh_b) annotation(
    Line(points = {{-22, -22}, {-28, -22}, {-28, -52}, {-60, -52}}, color = {46, 52, 54}));
  connect(psrc.pwh_a, H.pwh_a) annotation(
    Line(points = {{-84, -52}, {-140, -52}, {-140, -10}, {-136, -10}}, color = {46, 52, 54}));
  annotation(
    experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end Test_stank_002;