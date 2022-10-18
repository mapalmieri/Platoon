model TryCar
  Modelica.Blocks.Sources.Step step(height = 1.5, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-76, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Simple_car car(v0 = 0, x0 = 0)  annotation(
    Placement(visible = true, transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Following_car_with_noise following_car_with_noise(seed = 325, stdv = 0.1, step = 0.1,v0 = 0, x0 = 0)  annotation(
    Placement(visible = true, transformation(origin = {0, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(step.y, car.accel) annotation(
    Line(points = {{-64, 2}, {-10, 2}}, color = {0, 0, 127}));
  connect(following_car_with_noise.accel, step.y) annotation(
    Line(points = {{-8, -72}, {-64, -72}, {-64, 2}}, color = {0, 0, 127}));
protected
  annotation(
    uses(Modelica(version = "4.0.0"), ModelicaReference(version = "3.2.3")));
end TryCar;