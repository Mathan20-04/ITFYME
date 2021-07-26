public class Rectangle {
    float length;
    float width;
    double Area;
    double perimeter;
    public Rectangle(float length, float width) {
        this.length = length;
        this.width = width;
    }  
    public Rectangle(){
        this.length = 0.0f;
        this.width = 0.0f;
        
    }  
    public float getLength() {
        return length;
    }
    public void setLength(float length) {
        this.length = length;
    }
    public float getWidth() {
        return width;
    }
    public void setWidth(float width) {
        this.width = width;
    }
    public double getArea() {
        Area=length*width;
        return Area;
    }
    public double getPerimeter() {
        perimeter=2*(length+width);
        return perimeter;
    }
    public String toString() {
        return "Rectangle [length=" + length + ", width=" + width + "]";
    }
    




}    
    