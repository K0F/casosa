/**
Timeline axis of generic events
Copyright (C) 2015 Krystof Pesek

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/


class Entry{
  float start,end;
  String typ;
  String name;
  PVector pos;
  Timeline parent;
  float b;
  float w;
  boolean over;

  Entry(Timeline _parent,String _name,String _typ,String _st,String _en){
    parent = _parent;
    name = _name;
    typ = _typ;
    start = parseFloat(_st);
    end = parseFloat(_en);

    b = parent.b;

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
    //parent.Y=parent.Y%(height-200);
    parent.Y+=6;
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

    if(over){


      textAlign(RIGHT);
      text((int)start+"\n"+(int)(start-parent.narozeni)+" years",pos.x-4,height/2-8-24);

      textAlign(LEFT);
      text((int)end+"\n"+(int)(end-parent.narozeni)+" years",pos.x+w+4,height/2-8-24);

      stroke(0,100);
      line(pos.x,0,pos.x,height);
      line(pos.x+w,0,pos.x+w,height);

    }
  }

  boolean over(){
    if(mouseX>pos.x&&mouseX<pos.x+w&&mouseY>pos.y-12&&mouseY<pos.y)
      return true;
    else
      return false;
  }

  ////////////////////////////////////

}
