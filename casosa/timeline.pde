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


class Timeline{


  MultiTimeline parent;
  color c;
  float Y = -height/2+100;
  String filename;
  Parser parser;
  ArrayList entries;
  float min,max;
  int X,YY;


  float b;

  String jmeno;
  int vek;
  int narozeni;
  int umrti;

  boolean over;
  boolean plot = true;

  Timeline(MultiTimeline _parent,String _filename){
    parent = _parent;
    filename = _filename;

    b = parent.b;

    YY=parent.Y;
    parent.Y+=12;

    X=parent.X;
    parent.X+=150;
    c = color(X/150.0/4.0*255,127,127);

    jmeno = splitTokens(filename,"-")[0];
    narozeni = parseInt(splitTokens(splitTokens(filename,"-")[1],"_")[0]);
    umrti = parseInt(splitTokens(splitTokens(filename,"-")[1],"_")[1]);
    vek = umrti-narozeni;

    min = 100000;
    max = 0;

    parser = new Parser(this,filename);

    if(DEBUG)
      println(jmeno+" "+narozeni+" "+umrti+" "+vek);
  }

  boolean over(){

    if(mouseX>X&&mouseX<X+150&&mouseY>0&&mouseY<50)
      return true;
    else
      return false;

  }


  void draw(){

    over = over();

    pushMatrix();
    translate(X,0);
    fill(c,plot?255:127);
    rect(0,0,150,50);
    fill(0);
    text(jmeno,10,12);
    text("*"+narozeni+" - X"+umrti,10,24);
    text("age: "+vek,10,36);
    popMatrix();

    float born = map(narozeni,parent.min,parent.max,100,width-100);
    float died = map(umrti,parent.min,parent.max,100,width-100);
    float life = died-born;

    noStroke();
    fill(c,plot?255:127);
    rect(born,YY,life,24);
    fill(0);
    text(jmeno+" "+narozeni+"-"+umrti,born+4,YY+12);

}

void drawEntries(){
    if(plot)
      Y=-height/2+100;
      for(int i = 0; i < entries.size();i++){
        Entry tmp = (Entry)entries.get(i);
        tmp.rescale();
        tmp.draw();
        Y+=8;
      }
  }
}
