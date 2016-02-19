private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2; 
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	fill(169,169,169,40);
	ellipse(320,320,300,50);
	stroke(0,139,139); //(0,128,0)  
	line(320,320,320,200); //(320,480,320,380) 
	branches(320,260,25,3*Math.PI/2);
	stroke(32,178,170); //(34,139,34); 
	drawBranches(320,210,100,3*Math.PI);  //(320,380,100)
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1=2*angle/3 + branchAngle;
	double angle2=angle - branchAngle;
	branchLength=branchLength*fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if(branchLength>smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
	}
} 
public void branches(int x,int y, double branchLength, double angle) 
{   
	double angle1=angle + branchAngle;
	double angle2=angle - branchAngle;
	branchLength=branchLength*fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if(branchLength>smallestBranch)
	{
		branches(endX1,endY1,branchLength,angle1);
		branches(endX2,endY2,branchLength,angle2);
	}
} 
