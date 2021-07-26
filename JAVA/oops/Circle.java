public class Circle{
    double radius=0.1;
    String color="red";
    public Circle(double radius) {
        this.radius = radius;
               
    }
    public Circle() {
       
               
    }

    public Circle(double radius, String color) {
        this.radius = radius;
        this.color = color;
    }
    public double getRadius() {
        return radius;
    }
    public void setRadius(double radius) {
        this.radius = radius;
    }
    public String getColor() {
        return color;
    }
    public void setColor(String color) {
        this.color = color;
    }
    public String toString() {
        return "Circle [color=" + color + ", radius=" + radius + "]";
    }
    public double getArea() {
        return 3.14*radius*radius;
    }

}