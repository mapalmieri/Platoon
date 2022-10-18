model Simple_car
  Modelica.Blocks.Interfaces.RealOutput x annotation(
    Placement(visible = true, transformation(origin = {100, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput speed annotation(
    Placement(visible = true, transformation(origin = {100, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput accel annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  parameter Real x0 = 3;
  parameter Real v0 = 0.0;
  Modelica.Blocks.Interfaces.RealOutput accel_out annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-18, -18}, {18, 18}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T = 0.5, k = 1)  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
initial equation
  x = x0;
  speed = v0;
equation
  der(x) = speed;
  der(speed) = accel_out;
  connect(firstOrder.u, accel) annotation(
    Line(points = {{-12, 0}, {-100, 0}}, color = {0, 0, 127}));
  connect(accel_out, firstOrder.y) annotation(
    Line(points = {{100, 0}, {12, 0}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end Simple_car;