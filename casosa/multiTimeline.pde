

class MultiTimeline{
  String filenames[];
  ArrayList timelines;
  int X;
  int Y;
  float min,max;

  MultiTimeline(String[] _filenames){
    filenames = _filenames;
    timelines = new ArrayList();


    min = 1000000;
    max = 0;

    X=0;
    Y=200;

    for(int i = 0; i < filenames.length;i++){
      timelines.add(new Timeline(this,filenames[i]));
    }
  }

  void draw(){
    pushStyle();
    stroke(0,100);
    strokeWeight(2);
    line(0,height/2,width,height/2);
    
    for(float i = min; i < max;i+=5){
      float time = map(i,min,max,100,width-100);
      line(time,height/2-10,time,height/2+10);
      fill(0,127);
      text((int)i,time,height/2-4);
    }
    
    popStyle();

for(int i = 0; i < timelines.size();i++){
      Timeline tl = (Timeline)timelines.get(i);
      tl.draw();
    }

  }

  void scale(){

  }




}