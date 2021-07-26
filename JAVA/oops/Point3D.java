public class Point3D extends Point2D{
    float z;
    public Point3D(){

    }

    public Point3D(float z) {
        this.z=z;
    }

    public Point3D(float x, float y, float z) {
        super(x, y);
        this.z = z;
    }

    public float getZ() {
        return z;
    }

    public void setZ(float z) {
        this.z = z;
    }
    public void setXYZ(float x,float y,float z) {
        setX(x);
        setY(y);
        this.z = z;
    }
    public float[] getXYZ(){
        float[] a=new float[3];
        a[0]=this.x;
        a[1]=this.y;
        a[2]=this.z;
        return a;
    }
     @Override
    public String toString() {
        return "Point3D [x=" + x + ", y=" + y + ",z="+ z +"]";
    }
    


    
}