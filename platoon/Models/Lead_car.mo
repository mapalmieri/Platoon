model LeadCar

 parameter Integer seed = 3000;
 parameter Real stdv = 0.5;
 parameter Real step = 0.1;
 parameter Real Amplitude = 0.6;
 parameter Real Frequency= 0.031;
 
 
  Simple_car simple_car annotation(
    Placement(visible = true, transformation(origin = {-29, 9}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput x annotation(
    Placement(visible = true, transformation(origin = {120, 72}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {108, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput speed annotation(
    Placement(visible = true, transformation(origin = {120, 8}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine(amplitude = Amplitude,f = Frequency, offset = 0)  annotation(
    Placement(visible = true, transformation(origin = {-82, 10}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput accel annotation(
    Placement(visible = true, transformation(origin = {123, -79}, extent = {{-23, -23}, {23, 23}}, rotation = 0), iconTransformation(origin = {108, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput x_noise annotation(
    Placement(visible = true, transformation(origin = {120, 44}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {118, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput speed_noise annotation(
    Placement(visible = true, transformation(origin = {120, -38}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {116, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation(
    Placement(visible = true, transformation(origin = {76, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {78, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod = step, sigma = stdv, useAutomaticLocalSeed = true, useGlobalSeed = true)  annotation(
    Placement(visible = true, transformation(origin = {28, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Noise.NormalNoise normalNoise1(samplePeriod = step, sigma = stdv, useAutomaticLocalSeed = true, useGlobalSeed = true) annotation(
    Placement(visible = true, transformation(origin = {26, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(enableNoise = true, fixedSeed = seed)  annotation(
    Placement(visible = true, transformation(origin = {-78, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
 connect(x, simple_car.x) annotation(
    Line(points = {{120, 72}, {4, 72}, {4, 27.9375}, {-6, 27.9375}, {-6, 27}}, color = {0, 0, 127}));
 connect(simple_car.accel, sine.y) annotation(
    Line(points = {{-52, 9}, {-52, 10}, {-67, 10}}, color = {0, 0, 127}));
 connect(add.y, x_noise) annotation(
    Line(points = {{87, 42}, {103.5, 42}, {103.5, 44}, {120, 44}}, color = {0, 0, 127}));
 connect(add.u1, x) annotation(
    Line(points = {{64, 48}, {40, 48}, {40, 72}, {120, 72}}, color = {0, 0, 127}));
  connect(add1.y, speed_noise) annotation(
    Line(points = {{90, -38}, {120, -38}}, color = {0, 0, 127}));
 connect(add1.u1, speed) annotation(
    Line(points = {{66, -32}, {60, -32}, {60, 8}, {120, 8}}, color = {0, 0, 127}));
 connect(normalNoise.y, add.u2) annotation(
    Line(points = {{39, 36}, {64, 36}}, color = {0, 0, 127}));
  connect(normalNoise1.y, add1.u2) annotation(
    Line(points = {{37, -44}, {66, -44}}, color = {0, 0, 127}));
 connect(simple_car.speed, speed) annotation(
    Line(points = {{-6, -9}, {20, -9}, {20, 8}, {120, 8}}, color = {0, 0, 127}));
 connect(simple_car.accel_out, accel) annotation(
    Line(points = {{-6, 9}, {4, 9}, {4, -79}, {123, -79}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end LeadCar;