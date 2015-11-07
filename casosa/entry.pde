
class Entry{
  float start,end;
  String typ;
  String name;
  PVector pos;
  Timeline parent;
  float b = 100;
  float w;
  boolean over;

  Entry(Timeline _parent,String _name,String _typ,String _st,String _en){
    parent = _parent;
    name = _name;
    typ = _typ;
    start = parseFloat(_st);
    end = parseFloat(_en);

    parent.parent.max = max(end,parent.parent.max);
    parent.parent.min = min(start,parent.parent.min);

    if(DEBUG)
    println("creating entry: " +name);
  }

  void scale(){
    float sx = map(start,parent.parent.min,parent.parent.max,b,width-b);
    float ex = map(end,parent.parent.min,parent.parent.max,b,width-b);
    w = ex-sx;

    pos = new PVector(sx,height/2+parent.Y);
    parent.Y+=12;
    parent.Y=parent.Y%height;
  }

  void move(){
   Entry overs[] = getOverlaps();  
   for(int i = 0 ; i < overs.length;i++){
    if(abs(pos.y-overs[i].pos.y)<24 && parent.entries.indexOf(overs[i])>parent.entries.indexOf(this))
     overs[i].pos.y+=0.1;
   }
  }

  Entry[] getOverlaps(){
    Entry[] tmp;
    ArrayList over = new ArrayList();

    for(int i = 0 ; i < parent.entries.size();i++){
      Entry en = (Entry)parent.entries.get(i);
      boolean o = false;
      
      if(pos.x+w>=en.pos.x&&pos.x+w<=en.pos.x+en.w)
      o = true;

      if(pos.x>=en.pos.x&&pos.x<=en.pos.x+en.w)
      o = true;

      if(i==parent.entries.indexOf(this))
      o = false;

      if(o)
      over.add(en);
    }

    tmp = new Entry[over.size()];
    for(int i = 0; i < tmp.length;i++)
    {
    Entry e = (Entry)parent.entries.get(i);
    tmp[i] = e;
    }

    return tmp;
  }


  ////////////////////////////////////

  void draw(){
    //move();

    over=over();

    fill(parent.c,over?255:127);
    stroke(0);
    rect(pos.x,pos.y-10,w,12);
    fill(0);
    text(name,pos.x+4,pos.y);

    stroke(0,100);
    line(pos.x,pos.y,pos.x,height);


    if(over)
    text((int)start+" ---> "+(int)end,pos.x+4,height/2-4);
  }

  boolean over(){
    if(mouseX>pos.x&&mouseX<pos.x+w&&mouseY>pos.y-12&&mouseY<pos.y)
    return true;
    else
    return false;
  }
  
  ////////////////////////////////////

}
