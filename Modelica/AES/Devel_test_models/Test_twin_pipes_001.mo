within AES.Devel_test_models;

model Test_twin_pipes_001
  extends Icons.TestModel;
  inner AES.ProcessComponents.Thermal.System_settings.System_liquid system annotation(
    Placement(visible = true, transformation(origin = {-270, 148}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdP(y = if time < 500 then 0.1 elseif time < 2000 then 0.6
   elseif time < 3000 then 0.9 else 0.2) annotation(
    Placement(visible = true, transformation(origin = {-230, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression cmdQ(y = 5000) annotation(
    Placement(visible = true, transformation(origin = {-230, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.surfQcond_prescribed Q annotation(
    Placement(visible = true, transformation(origin = {-150, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.Pressuriser pressuriser annotation(
    Placement(visible = true, transformation(origin = {-230, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.Pump_volumetric pumpC(w0 = 5) annotation(
    Placement(visible = true, transformation(origin = {-190, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Piping_liquid.Tube tube01 annotation(
    Placement(visible = true, transformation(origin = {-150, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner ProcessComponents.Thermal.System_settings.System_terrain terrain annotation(
    Placement(visible = true, transformation(origin = {-230, 148}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.Interfaces.pwhPortSplitter split annotation(
    Placement(visible = true, transformation(origin = {-108, 24}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipe Tpipe1 annotation(
    Placement(visible = true, transformation(origin = {-70, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipe Tpipe2 annotation(
    Placement(visible = true, transformation(origin = {-32, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  AES.ProcessComponents.Thermal.DistrictHeating.TwinPipeClosure TpipeC annotation(
    Placement(visible = true, transformation(origin = {10, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(cmdQ.y, Q.Q) annotation(
    Line(points = {{-219, 110}, {-158, 110}}, color = {0, 0, 127}));
  connect(pressuriser.pwh_b, pumpC.pwh_a) annotation(
    Line(points = {{-218, 30}, {-202, 30}}, color = {46, 52, 54}));
  connect(cmdP.y, pumpC.cmd) annotation(
    Line(points = {{-219, 90}, {-190, 90}, {-190, 38}}, color = {0, 0, 127}));
  connect(pumpC.pwh_b, tube01.pwh_a) annotation(
    Line(points = {{-178, 30}, {-162, 30}}, color = {46, 52, 54}));
  connect(Q.surf, tube01.surf) annotation(
    Line(points = {{-150, 102}, {-150, 36}}, color = {144, 5, 5}));
  connect(tube01.pwh_b, split.pwh_H) annotation(
    Line(points = {{-138, 30}, {-120, 30}}, color = {46, 52, 54}));
  connect(split.pwh_C, pressuriser.pwh_a) annotation(
    Line(points = {{-120, 18}, {-252, 18}, {-252, 30}, {-242, 30}}, color = {46, 52, 54}));
  connect(split.pwhTwin_HC, Tpipe1.tpwh_a) annotation(
    Line(points = {{-96, 24}, {-82, 24}}));
  connect(Tpipe1.tpwh_b, Tpipe2.tpwh_a) annotation(
    Line(points = {{-58, 24}, {-44, 24}}));
  connect(Tpipe2.tpwh_b, TpipeC.tpwh_a) annotation(
    Line(points = {{-20, 24}, {-2, 24}}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 1e+7, Tolerance = 1e-6, Interval = 1000),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts -d=aliasConflicts ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})));
end Test_twin_pipes_001;