model Following_car_with_noise

  Modelica.Blocks.Interfaces.RealOutput x annotation(
    Placement(visible = true, transformation(origin = {110, 74}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {106, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput speed annotation(
    Placement(visible = true, transformation(origin = {112, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {106, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput accel annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));

  parameter Real x0 = 300;
  parameter Real v0 = 30;
  
  parameter Real stdv = 0.5;
 parameter Real step = 0.1;

  
  parameter Integer seed = 3000;
  
  
  Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod = step,sigma = stdv, useAutomaticLocalSeed = true, useGlobalSeed = true)  annotation(
    Placement(visible = true, transformation(origin = {18, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation(
    Placement(visible = true, transformation(origin = {54, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Noise.NormalNoise normalNoise1(samplePeriod = step,sigma = stdv, useAutomaticLocalSeed = true, useGlobalSeed = true) annotation(
    Placement(visible = true, transformation(origin = {-22, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput x_noise annotation(
    Placement(visible = true, transformation(origin = {106, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput speed_noise annotation(
    Placement(visible = true, transformation(origin = {106, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(enableNoise = true, fixedSeed = seed)  annotation(
    Placement(visible = true, transformation(origin = {-64, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-6, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput accel_out annotation(
    Placement(visible = true, transformation(origin = {108, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  x = x0;
  speed = v0;
equation
  
  
  der(x) = speed;
  
  connect(normalNoise1.y, add1.u1) annotation(
    Line(points = {{-10, -38}, {4, -38}, {4, -44}, {18, -44}}, color = {0, 0, 127}));
  connect(speed, add1.u2) annotation(
    Line(points = {{112, -60}, {118, -60}, {118, -88}, {4, -88}, {4, -56}, {18, -56}}, color = {0, 0, 127}));
  connect(add1.y, speed_noise) annotation(
    Line(points = {{42, -50}, {76, -50}, {76, -38}, {106, -38}}, color = {0, 0, 127}));
  connect(add.y, x_noise) annotation(
    Line(points = {{65, 46}, {85, 46}, {85, 48}, {106, 48}}, color = {0, 0, 127}));
  connect(accel, firstOrder.u) annotation(
    Line(points = {{-90, 10}, {-55, 10}, {-55, 12}, {-18, 12}}, color = {0, 0, 127}));
  connect(add.u2, normalNoise.y) annotation(
    Line(points = {{42, 40}, {30, 40}, {30, 42}}, color = {0, 0, 127}));
  connect(x, add.u1) annotation(
    Line(points = {{110, 74}, {34, 74}, {34, 52}, {42, 52}}, color = {0, 0, 127}));
  connect(firstOrder.y, accel_out) annotation(
    Line(points = {{5, 12}, {108, 12}}, color = {0, 0, 127}));  
  
  der(speed) = accel_out;

annotation(
    uses(Modelica(version = "4.0.0")));
end Following_car_with_noise;